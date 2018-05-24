package dbutils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.util.StringTokenizer;

public class testPython {

	public static void main(String[] args) throws IOException {
		testPython testPython = new testPython();
		testPython.test(1.2, 1.2, 8.0, 10.0);
	}

	public String test(double a, double b, double c, double d) throws IOException {
		// System.out.println("start");
		String testdata = "[";
		testdata += a + ",";
		testdata += b + ",";
		testdata += c + ",";
		testdata += d + "]";
		String command = "python D:\\bpnet.py --testdata " + testdata;
		System.out.println(command);
		Process pr = Runtime.getRuntime().exec(command);
		// System.out.println("测试点1");
		InputStreamReader stdin=new InputStreamReader(pr.getInputStream());
		LineNumberReader input=new LineNumberReader(stdin);
        String line;
        StringBuilder stringBuilder = new StringBuilder();
        System.out.println("waiting...");
        while((line=input.readLine())!=null ){
        	stringBuilder.append(line);
        	stringBuilder.append("\r\n");
            System.out.println(line);//得到输出
        }
		System.out.println(stringBuilder.toString());
		stdin.close();
		try {
			pr.waitFor();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return stringBuilder.toString();
	}
	public String testD(double a, double b, double c, double d) throws IOException {
		// System.out.println("start");
		String testdata = "[";
		testdata += a + ",";
		testdata += b + ",";
		testdata += c + ",";
		testdata += d + "]";
		String command = "python D:\\bpnetLIXUE.py --testdata " + testdata;
		System.out.println(command);
		Process pr = Runtime.getRuntime().exec(command);
		// System.out.println("测试点1");
		InputStreamReader stdin=new InputStreamReader(pr.getInputStream());
		LineNumberReader input=new LineNumberReader(stdin);
        String line;
        StringBuilder stringBuilder = new StringBuilder();
        System.out.println("waiting...");
        while((line=input.readLine())!=null ){
        	stringBuilder.append(line);
        	stringBuilder.append("\r\n");
            System.out.println(line);//得到输出
        }
		System.out.println(stringBuilder.toString());
		stdin.close();
		try {
			pr.waitFor();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return stringBuilder.toString();
	}
	public String testR(double a, double b, double c, double d,double e) throws IOException {
		// System.out.println("start");
		String testdata = "[";
		testdata += a + ",";
		testdata += b + ",";
		testdata += c + ",";
		testdata += d + ",";
		testdata += e + "]";
		String command = "python d://bpnetkangf.py --testdata " + testdata;
		System.out.println(command);
		Process pr = Runtime.getRuntime().exec(command);
		// System.out.println("测试点1");
		InputStreamReader stdin=new InputStreamReader(pr.getInputStream());
		LineNumberReader input=new LineNumberReader(stdin);
        String line;
        StringBuilder stringBuilder = new StringBuilder();
        System.out.println("waiting...");
        while((line=input.readLine())!=null ){
        	stringBuilder.append(line);
        	stringBuilder.append("\r\n");
            System.out.println(line);//得到输出
        }
		System.out.println(stringBuilder.toString());
		stdin.close();
		try {
			pr.waitFor();
		} catch (InterruptedException ee) {
			ee.printStackTrace();
		}
		return stringBuilder.toString();
	}

}
