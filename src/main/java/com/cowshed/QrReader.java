package com.cowshed;

import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;


import com.google.zxing.BinaryBitmap;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.HybridBinarizer;

public class QrReader {
public static void main(String[] args) throws NotFoundException, IOException {
	
	File file = new File("E:\\QR-PNG\\9421-akash123.png");
	Result rs = new MultiFormatReader().decode(new BinaryBitmap(new HybridBinarizer(new BufferedImageLuminanceSource(ImageIO.read(file)))));
	
	String context = rs.getText();
	System.out.println(context);
}
}
