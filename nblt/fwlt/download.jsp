<%@ page contentType="text/html;charset=gb2312"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ page import="java.io.File"%>
<%@ page import="java.io.*"%>
<title>�ĵ����ر�����תҳ��</title>
</head>

<body>
<%
String root = getServletContext().getRealPath("/");      //�õ���վ����·��
//String filepath = "upload_file\\lwfile\\";                       //�����ļ���ŵ����·��(windows)
String filepath  = request.getParameter("filepath");                           //�����ļ���ŵ����·��(linux)
String fileName = request.getParameter("filename");    //�õ��ļ���
//String myName = "�����ĵ�����.doc";        
String myName=cf.GB2Uni(cf.getParameter(request,"fjym"));//�ļ�����

out.print(root + filepath + fileName);

// ������Ӧͷ�����ر�����ļ���
response.reset();
//response.setContentType("application/octet-stream");       //windows
//response.addHeader("Content-Disposition", "filename=\"" + myName + "\"");      //windows
response.setContentType("application/octet-stream; charset=GBK");     //linux
//linux,��ɫ���ֺ���Ҫ,����������˵
response.addHeader("Content-Disposition", "attachment; filename=\"" + new String(myName.getBytes("gb2312"),"iso8859-1") + "\""); 

//�½��ļ����������
OutputStream output = null;
FileInputStream fis = null;
try{
//�½�File����,ͬ�������ѡ�����Լ���InputStream
File f = new File(filepath + fileName);
//�½��ļ��������������
output = response.getOutputStream();
fis = new FileInputStream(f);
//����ÿ��д�뻺���С
byte[] b = new byte[(int)f.length()];
//out.print(f.length());
//�������д��ͻ���
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
