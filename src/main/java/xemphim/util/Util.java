package xemphim.util;

import java.io.ByteArrayOutputStream;
import java.io.File;

import org.springframework.web.multipart.MultipartFile;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

public class Util {
	
	public static boolean isImage(String fileName) {
		if (fileName.endsWith(".jpg") || fileName.endsWith(".png") || fileName.endsWith(".gif")
				|| fileName.endsWith(".jpeg")) {
			return true;
		}
		return false;
	}

	public static String uploadFile(MultipartFile multipartFile,String realPathtoUploads) {

		if (!new File(realPathtoUploads).exists()) {
			new File(realPathtoUploads).mkdir();
		}

		String orgName = multipartFile.getOriginalFilename();
		String filePath = realPathtoUploads + orgName;
		File dest = new File(filePath);
		try {
			multipartFile.transferTo(dest);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return orgName;

	}
	
	public static byte[] getQRCodeImage(String text, int width, int height) {
		try {
			QRCodeWriter qrCodeWriter = new QRCodeWriter();
			BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, width, height);
			ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
			MatrixToImageWriter.writeToStream(bitMatrix, "png", byteArrayOutputStream);
			return byteArrayOutputStream.toByteArray();
		} catch (Exception e) {
			return null;
		}
	}
}
