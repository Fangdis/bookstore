/**
 *
 */
package com.zjnu.fd.bookstore.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;

/**
 * 方法描述:
 *
 * @param
 * @author Administrator 创建时间：2014年11月12日 上午10:20:32
 * @version 单例设计模式
 */
public class RandomNumUtil {
	private ByteArrayInputStream image;// 图像
	private String str;// 验证码
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	private RandomNumUtil() {
		init();// 初始化属性
	}

	/*
	 * 取得RandomNumUtil实例
	 */
	public static RandomNumUtil Instance() {
		return new RandomNumUtil();
	}

	/*
	 * 取得验证码图片
	 */
	public ByteArrayInputStream getImage() {
		return this.image;
	}

	/*
	 * 取得图片的验证码
	 */
	public String getString() {
		return this.str;
	}

	private void init() {
		// 在内存中创建图象
		int width = 70, height = 30;
		BufferedImage image = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		// 获取图形上下文
		Graphics g = image.getGraphics();
		// 生成随机类
		Random random = new Random();
		// 设定背景色
		// g.setColor(getRandColor(200, 250));
		g.setColor(new Color(255, 255, 255));
		g.fillRect(0, 0, width, height);
		// 设定字体
		g.setFont(new Font("Times New Roman", Font.PLAIN + Font.ITALIC
				+ Font.BOLD, 22));
		// 随机产生155条干扰线，使图象中的认证码不易被其它程序探测到
		g.setColor(getRandColor(160, 200));
		/*
		 * for (int i = 0; i < 155; i++) { int x = random.nextInt(width); int y
		 * = random.nextInt(height); int xl = random.nextInt(12); int yl =
		 * random.nextInt(12); g.drawLine(x, y, x + xl, y + yl); }
		 */
		// 取随机产生的认证码(6位)
		String sRand = "";
		// for (int i=0;i<6;i++){
		// String rand=String.valueOf(random.nextInt(10));
		// sRand+=rand;
		char selectChar[] = { '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A',
				'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
				'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
				'm', 'n', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };// 所有候选组成验证码的字符，当然也可以用中文的
		for (int i = 0; i < 4; i++) {
			// String rand=String.valueOf(random.nextInt(10));
			// sRand+=rand;

			int charIndex = (int) Math.floor(Math.random() * 59);
			String rand = String.valueOf(selectChar[charIndex]);
			sRand += selectChar[charIndex];
			// 将认证码显示到图象中
			g.setColor(new Color(20 + random.nextInt(110), 20 + random
					.nextInt(110), 20 + random.nextInt(110)));
			// 调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生成
			g.drawString(rand, 13 * i + 4, 22);
			this.str = sRand;/* 赋值验证码 */
		}
		// 图象生效
		g.dispose();
		ByteArrayInputStream input = null;
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		try {
			ImageOutputStream imageOut = ImageIO
					.createImageOutputStream(output);
			ImageIO.write(image, "JPEG", imageOut);
			imageOut.close();
			input = new ByteArrayInputStream(output.toByteArray());
		} catch (Exception e) {
			System.out.println("验证码图片产生出现错误：" + e.toString());
		}

		this.image = input;/* 赋值图像 */
	}

	/*
	 * 给定范围获得随机颜色
	 */
	private Color getRandColor(int fc, int bc) {
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}

	public static String rand() {
		StringBuffer stb = new StringBuffer();
		Random rd = new Random();
		for (int i = 0; i < 4; i++) {
			stb.append(rd.nextInt(9));
		}
		return stb.toString();
	}

	/**
	 * author:jinniu_070
	 * 2015年9月19日下午1:39:07
	 * des: 生成6位字母数字随机码
	 */
	public static String getRandomString() { // length表示生成字符串的长度
		String base = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 6; i++) {
			int number = random.nextInt(base.length());
			sb.append(base.charAt(number));
		}
		return sb.toString();
	}
	/**
	 * author:jinniu_070
	 * 2015年9月19日下午1:39:04
	 * des: 生成当前时间加四位字母数字
	 */
	public static String getRandomTimeString(){
		String nowTime=sdf.format(new Date());
		String base = "0123456789";
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		for(int i=0;i<4;i++){
			int number = random.nextInt(base.length());
			sb.append(base.charAt(number));
		}
		return nowTime+sb.toString();
	}

}
