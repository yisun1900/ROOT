<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String kp_ybjkp_sgd=null;
	String kp_ybjkp_ybjsl=null;
	String kp_ybjkp_cgcs=null;
	String kp_ybjkp_cgsbcs=null;
	String kp_ybjkp_cgcgcs=null;
	String kp_ybjkp_tsjjf=null;
	String kp_ybjkp_ybjpf=null;
	String kp_ybjkp_qssj=null;
	String kp_ybjkp_jzsj=null;
	String kp_ybjkp_kpr=null;
	kp_ybjkp_sgd=request.getParameter("kp_ybjkp_sgd");
	if (kp_ybjkp_sgd!=null)
	{
		kp_ybjkp_sgd=cf.GB2Uni(kp_ybjkp_sgd);
		if (!(kp_ybjkp_sgd.equals("")))	wheresql+=" and  (kp_ybjkp.sgd='"+kp_ybjkp_sgd+"')";
	}
	kp_ybjkp_ybjsl=request.getParameter("kp_ybjkp_ybjsl");
	if (kp_ybjkp_ybjsl!=null)
	{
		kp_ybjkp_ybjsl=kp_ybjkp_ybjsl.trim();
		if (!(kp_ybjkp_ybjsl.equals("")))	wheresql+=" and (kp_ybjkp.ybjsl="+kp_ybjkp_ybjsl+") ";
	}
	kp_ybjkp_cgcs=request.getParameter("kp_ybjkp_cgcs");
	if (kp_ybjkp_cgcs!=null)
	{
		kp_ybjkp_cgcs=kp_ybjkp_cgcs.trim();
		if (!(kp_ybjkp_cgcs.equals("")))	wheresql+=" and (kp_ybjkp.cgcs="+kp_ybjkp_cgcs+") ";
	}
	kp_ybjkp_cgsbcs=request.getParameter("kp_ybjkp_cgsbcs");
	if (kp_ybjkp_cgsbcs!=null)
	{
		kp_ybjkp_cgsbcs=kp_ybjkp_cgsbcs.trim();
		if (!(kp_ybjkp_cgsbcs.equals("")))	wheresql+=" and (kp_ybjkp.cgsbcs="+kp_ybjkp_cgsbcs+") ";
	}
	kp_ybjkp_cgcgcs=request.getParameter("kp_ybjkp_cgcgcs");
	if (kp_ybjkp_cgcgcs!=null)
	{
		kp_ybjkp_cgcgcs=kp_ybjkp_cgcgcs.trim();
		if (!(kp_ybjkp_cgcgcs.equals("")))	wheresql+=" and (kp_ybjkp.cgcgcs="+kp_ybjkp_cgcgcs+") ";
	}
	kp_ybjkp_tsjjf=request.getParameter("kp_ybjkp_tsjjf");
	if (kp_ybjkp_tsjjf!=null)
	{
		kp_ybjkp_tsjjf=kp_ybjkp_tsjjf.trim();
		if (!(kp_ybjkp_tsjjf.equals("")))	wheresql+=" and (kp_ybjkp.tsjjf="+kp_ybjkp_tsjjf+") ";
	}
	kp_ybjkp_ybjpf=request.getParameter("kp_ybjkp_ybjpf");
	if (kp_ybjkp_ybjpf!=null)
	{
		kp_ybjkp_ybjpf=kp_ybjkp_ybjpf.trim();
		if (!(kp_ybjkp_ybjpf.equals("")))	wheresql+=" and (kp_ybjkp.ybjpf="+kp_ybjkp_ybjpf+") ";
	}
	kp_ybjkp_qssj=request.getParameter("kp_ybjkp_qssj");
	if (kp_ybjkp_qssj!=null)
	{
		kp_ybjkp_qssj=kp_ybjkp_qssj.trim();
		if (!(kp_ybjkp_qssj.equals("")))	wheresql+="  and (kp_ybjkp.qssj=TO_DATE('"+kp_ybjkp_qssj+"','YYYY/MM/DD'))";
	}
	kp_ybjkp_jzsj=request.getParameter("kp_ybjkp_jzsj");
	if (kp_ybjkp_jzsj!=null)
	{
		kp_ybjkp_jzsj=kp_ybjkp_jzsj.trim();
		if (!(kp_ybjkp_jzsj.equals("")))	wheresql+="  and (kp_ybjkp.jzsj=TO_DATE('"+kp_ybjkp_jzsj+"','YYYY/MM/DD'))";
	}
	kp_ybjkp_kpr=request.getParameter("kp_ybjkp_kpr");
	if (kp_ybjkp_kpr!=null)
	{
		kp_ybjkp_kpr=cf.GB2Uni(kp_ybjkp_kpr);
		if (!(kp_ybjkp_kpr.equals("")))	wheresql+=" and  (kp_ybjkp.kpr='"+kp_ybjkp_kpr+"')";
	}
	ls_sql="SELECT kp_ybjkp.sgd,sgdmc,kp_ybjkp.ybjsl,kp_ybjkp.cgcs,kp_ybjkp.cgsbcs,kp_ybjkp.cgcgcs,kp_ybjkp.tsjjf,kp_ybjkp.ybjpf,kp_ybjkp.qssj,kp_ybjkp.jzsj,kp_ybjkp.kpr  ";
	ls_sql+=" FROM kp_ybjkp,sq_sgd  ";
    ls_sql+=" where kp_ybjkp.sgd=sq_sgd.sgd";
    ls_sql+=wheresql;
	ls_sql+=" order by  kp_ybjkp.sgd ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Kp_ybjkpList.jsp","SelectKp_ybjkp.jsp","","EditKp_ybjkp.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"sgd","sq_dwxx_dwmc","kp_ybjkp_ybjsl","kp_ybjkp_cgcs","kp_ybjkp_cgsbcs","kp_ybjkp_cgcgcs","kp_ybjkp_tsjjf","kp_ybjkp_ybjpf","kp_ybjkp_qssj","kp_ybjkp_jzsj","kp_ybjkp_kpr"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"sgd"};
	pageObj.setKey(keyName);
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="8%">ʩ����</td>
	<td  width="8%">ʩ����</td>
	<td  width="8%">�ṩ���������</td>
	<td  width="8%">�ι۴���</td>
	<td  width="8%">�ι�ʧ�ܴ���</td>
	<td  width="8%">�ι۳ɹ�����</td>
	<td  width="8%">����Ӽ���</td>
	<td  width="8%">���������</td>
	<td  width="10%">������ʼʱ��</td>
	<td  width="10%">������ֹʱ��</td>
	<td  width="8%">������</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>