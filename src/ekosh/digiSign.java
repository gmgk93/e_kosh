package ekosh;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.PrivateKey;
import java.security.Security;
import java.security.cert.Certificate;
import java.util.Properties;

import org.bouncycastle.jce.provider.BouncyCastleProvider;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfSignatureAppearance;
import com.itextpdf.text.pdf.PdfStamper;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.security.BouncyCastleDigest;
import com.itextpdf.text.pdf.security.ExternalDigest;
import com.itextpdf.text.pdf.security.ExternalSignature;
import com.itextpdf.text.pdf.security.MakeSignature;
import com.itextpdf.text.pdf.security.MakeSignature.CryptoStandard;
import com.itextpdf.text.pdf.security.PrivateKeySignature;

public class digiSign {

	public static String temp,source,destination;
	public static String base = "D:/ishan/workspace/ekosh/WebContent/files/";
	
	/**
	 * A properties file that is PRIVATE. You should make your own properties
	 * file and adapt this line.sms
	 */
	
	public static String PATH = "D:/ishan/workspace/ekosh/key.properties";
	/** Some properties used when signing. */
	public static Properties properties = new Properties();
	/** One of the resources. */
	public static final String RESOURCE = "D:/ishan/workspace/ekosh/WebContent/img/sign.PNG";

	/*
	 * public void createPdf(String filename) throws IOException,
	 * DocumentException { Document document = new Document();
	 * PdfWriter.getInstance(document, new FileOutputStream(filename));
	 * document.open(); document.add(new Paragraph("Hello World!"));
	 * document.close(); }
	 */

	/**
	 * Manipulates a PDF file src with the file dest as result
	 * 
	 * @param src
	 *            the original PDF
	 * @param dest
	 *            the resulting PDF
	 * @throws GeneralSecurityException
	 * @throws IOException
	 * @throws DocumentException
	 * @throws FileNotFoundException
	 * @throws KeyStoreException
	 * @throws Exception
	 */
	public void signPdfFirstTime(String src, String dest, String alias) throws IOException,
			DocumentException, GeneralSecurityException {

		// String path = properties.getProperty("PRIVATE");
		String keystore_password = properties.getProperty("PASSWORD");// getting
																		// keystore
																		// passwd
		String key_password = properties.getProperty(alias);// getting
																	// alias
																	// passwd
		KeyStore ks = KeyStore.getInstance("pkcs12");// creating keystore
														// reference
		FileInputStream fin = new FileInputStream(
				"D:/ishan/workspace/ekosh/KEYSTORE.p12");
		ks.load(fin, keystore_password.toCharArray());
		
		PrivateKey pk = (PrivateKey) ks.getKey(alias,
				key_password.toCharArray());// getting private key of alias
		Certificate[] chain = ks.getCertificateChain(alias);// creating cert
															// using alias
		// reader and stamper
		// src=source file path dest=destination
		PdfReader reader = new PdfReader(src);
		FileOutputStream os = new FileOutputStream(dest);

		PdfStamper stamper = PdfStamper.createSignature(reader, os, '\0');

		// appearance
		PdfSignatureAppearance appearance = stamper.getSignatureAppearance();
		appearance.setImage(Image.getInstance(RESOURCE));
		appearance.setReason("Digital Signature");
		appearance.setLocation("Bangalore");
		appearance.setVisibleSignature(new Rectangle(480, 20, 580, 70), 1,
				"first");
		// digital signature
		ExternalSignature es = new PrivateKeySignature(pk, "SHA-1", "BC");

		ExternalDigest digest = new BouncyCastleDigest();

		String name = es.getEncryptionAlgorithm();
		System.out.print(name);

		MakeSignature.signDetached(appearance, digest, es, chain, null, null,
				null, 0, CryptoStandard.CMS);
	}

	public static void convert() throws IOException, DocumentException,
			GeneralSecurityException {
		Document document = new Document();
		// .gif and .jpg are ok too!
		//String output = "C:/Users/Rahul/Desktop/a.pdf";
		try {
			FileOutputStream fos = new FileOutputStream(temp);
			PdfWriter writer = PdfWriter.getInstance(document, fos);
			writer.open();
			document.open();
			if (source.endsWith("pdf")) {
				temp = source;

			}

			else if (source.endsWith("doc") || source.endsWith("docx")
					|| source.endsWith("txt")) {
				File file = new File(source);
				document.add(new Paragraph(org.apache.commons.io.FileUtils
						.readFileToString(file)));
				document.close();
				document.close();
				writer.close();
			} else {
				Image i = Image.getInstance(source);
				i.scaleToFit(595, 842);
				document.add(i);

				document.close();
				writer.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		

	}

	/**
	 * Main method.
	 *
	 * @param args
	 *            no arguments needed
	 */
	public static String convertAndSign(String a,String name) throws IOException,
			DocumentException, GeneralSecurityException {
		source = base+"new"+a;
		
		String file = a.substring(0, a.indexOf('.'));
		temp = base +"temp" + file + ".pdf";
		destination = base + "final" + file + ".pdf";
		convert();
		
		Security.addProvider(new BouncyCastleProvider());
		properties.load(new FileInputStream(PATH));
		digiSign signatures = new digiSign();
		signatures.signPdfFirstTime(temp, destination, name);
		return destination;
		

	}
}