package dbutils;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.util.ArrayList;
import java.util.List;

public class FirstJythonScript {

    public static void main(String[] args) throws IOException {
        // TODO Auto-generated method stub
    	FirstJythonScript firstJythonScript = new FirstJythonScript();
    	firstJythonScript.getMsg();
    	
    }
    public String getMsg() throws IOException{
    	Process proc=Runtime.getRuntime().exec("python D:\\data.py"); //执行py文件
        InputStreamReader stdin=new InputStreamReader(proc.getInputStream());
        LineNumberReader input=new LineNumberReader(stdin);
        String line;
        StringBuilder stringBuilder = new StringBuilder();
        
        while((line=input.readLine())!=null ){
        	stringBuilder.append(line);
        	stringBuilder.append("\r\n");//这里的\r\n，到最后是多了一个空行的
        	
            System.out.println(line);//得到输出
        }
        return stringBuilder.toString();
        
    }
    public String getDMsg() throws IOException{
    	Process proc=Runtime.getRuntime().exec("python D:\\dataLIXUE.py"); //执行py文件
        InputStreamReader stdin=new InputStreamReader(proc.getInputStream());
        LineNumberReader input=new LineNumberReader(stdin);
        String line;
        StringBuilder stringBuilder = new StringBuilder();
        
        while((line=input.readLine())!=null ){
        	stringBuilder.append(line);
        	stringBuilder.append("\r\n");//这里的\r\n，到最后是多了一个空行的
        	
            System.out.println(line);//得到输出
        }
        return stringBuilder.toString();
        
    }
    public String getRMsg() throws IOException{
    	Process proc=Runtime.getRuntime().exec("python D:\\datakangfu.py"); //执行py文件
        InputStreamReader stdin=new InputStreamReader(proc.getInputStream());
        LineNumberReader input=new LineNumberReader(stdin);
        String line;
        StringBuilder stringBuilder = new StringBuilder();
        
        while((line=input.readLine())!=null ){
        	stringBuilder.append(line);
        	stringBuilder.append("\r\n");//这里的\r\n，到最后是多了一个空行的
        	
            System.out.println(line);//得到输出
        }
        return stringBuilder.toString();
        
    }
    public String getAllMsg() throws IOException{
    	Process proc=Runtime.getRuntime().exec("python D:\\together.py"); //执行py文件
        InputStreamReader stdin=new InputStreamReader(proc.getInputStream());
        LineNumberReader input=new LineNumberReader(stdin);
        String line;
        StringBuilder stringBuilder = new StringBuilder();
        
        while((line=input.readLine())!=null ){
        	stringBuilder.append(line);
        	stringBuilder.append("\r\n");//这里的\r\n，到最后是多了一个空行的
        	
            System.out.println(line);//得到输出
        }
        return stringBuilder.toString();
        
    }
}