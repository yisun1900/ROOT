<%@ page contentType="text/html;charset=gb2312"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ page import="java.io.File"%>
<%@ page import="java.io.*"%>
<title>文档下载保存中转页面</title>
</head>

<body>
<%
String root = getServletContext().getRealPath("/");      //得到网站绝对路径
//String filepath = "upload_file\\lwfile\\";                       //设置文件存放的相对路径(windows)
String filepath  = request.getParameter("filepath");                           //设置文件存放的相对路径(linux)
String fileName = request.getParameter("filename");    //得到文件名
//String myName = "中文文档下载.doc";        
String myName=cf.GB2Uni(cf.getParameter(request,"fjym"));//文件改名

out.print(root + filepath + fileName);

// 设置响应头和下载保存的文件名
response.reset();
//response.setContentType("application/octet-stream");       //windows
//response.addHeader("Content-Disposition", "filename=\"" + myName + "\"");      //windows
response.setContentType("application/octet-stream; charset=GBK");     //linux
//linux,红色部分很重要,对于中文来说
response.addHeader("Content-Disposition", "attachment; filename=\"" + new String(myName.getBytes("gb2312"),"iso8859-1") + "\""); 

//新建文件输入输出流
OutputStream output = null;
FileInputStream fis = null;
try{
//新建File对象,同样你可以选择你自己的InputStream
File f = new File(filepath + fileName);
//新建文件输入输出流对象
output = response.getOutputStream();
fis = new FileInputStream(f);
//设置每次写入缓存大小
byte[] b = new byte[(int)f.length()];
//out.print(f.length());
//把输出流写入客户端
int i = 0;
while((i = fis.read(b)) > 0){
    output.write(b, 0, i);
}
output.flush();
}
catch(Exception e){
e.printStackTrace();
}
finally{
if(fis != null){
    fis.close();
    fis = null;
}
if(output != null){
    output.close();
    output = null;
}
}
%>
</body>
</html>
