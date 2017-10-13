package test;

import java.io.File;

public class Test {

	public static void main(String[] args) {
		
		new Test().test();
	}
	
	public void test(){
		
		File file = new File("E:/00-静态模板/");
		File[] tempList = file.listFiles();
		
		System.out.println("该目录下对象个数："+tempList.length);
		
		for (int i = 0; i < tempList.length; i++) {
		   
			if (tempList[i].isFile()) {
				System.out.println("文     件："+tempList[i]);
			}
			if (tempList[i].isDirectory()) {
				System.out.println("文件夹："+tempList[i]);
			}
		}
	}
}
