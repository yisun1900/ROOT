<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id='FSDX' scope='page' class='dxxt.FSDX'/><!-- ���ŷ��Ͱ� -->
<%@ include file="/getlogin.jsp" %>
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");

String[] xh=request.getParameterValues("xh");
String[] jssj=request.getParameterValues("jssj");//�����ֻ�
String[] xxqz=request.getParameterValues("xxqz");//��Ϣǰ׺  ���� ��������
String[] xxnr=request.getParameterValues("xxnr");//��Ϣ����
String dxnr=null;
String dxcs=null;
int count=0;
for (int i=0;i<xh.length ;i++ )
{
	count++;
	if (xxqz[i]!=null && xxqz[i]!="")
	{dxnr=cf.GB2Uni(xxqz[i])+","+cf.GB2Uni(xxnr[i]);}
	else {cf.GB2Uni(dxnr=xxnr[i]);}
//	out.print(jssj[i]+"--"+dxnr);
	dxcs=FSDX.jsdxfs(jssj[i],dxnr,yhdlm,"1");//���÷��Ͷ��ź���
	//����˵��:jssj:���պ���,����ж����","����
	//dxnr:���ŵ�����
	//yhdlm:�û���¼��
	//"1":�̶�����,1:��ʱ����;0:��ʱ����
	out.println(dxcs);//�����ͽ����ʾ��ҳ����
}
out.print("<font color='blue' size='+3'><b>"+count+"����Ϣ�������!</b></font>");
%>