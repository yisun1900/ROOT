<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=(String)session.getAttribute("dwbh");
String dwlx=(String)session.getAttribute("dwlx");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
//where dqbm='"+dqbm+"'
//and (dwlx='F1'  or dwlx='F2')
%>



<%
	//out.print(dqbm);
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	String ls_sql=null;
	String wheresql="";
	String shqk=null;
	String qh_xcpzzsh_shbbh=null;
	String qh_xcpzzsh_sqsj=null;
	String qh_xcpzzsh_tbr=null;
	String qh_xcpzzsh_zznr=null;
	String qh_xcpzzsh_sl=null;
	String qh_xcpzzsh_gg=null;
	String qh_xcpzzsh_xs=null;
	String qh_xcpzzsh_wznr=null;
	String qh_xcpzzsh_ysyq=null;
	String qh_xcpzzsh_qtyq=null;
	String qh_xcpzzsh_wcsj=null;
	String qh_xcpzzsh_bz=null;
	String sq_dwxx_dwmc=null;
	String scwjm=null;
	String qh_xcpzzsh_zgbmjlyj=null;
	qh_xcpzzsh_shbbh=request.getParameter("qh_xcpzzsh_shbbh");
	if (qh_xcpzzsh_shbbh!=null)
	{
		qh_xcpzzsh_shbbh=cf.GB2Uni(qh_xcpzzsh_shbbh);
		if (!(qh_xcpzzsh_shbbh.equals("")))	wheresql+=" and  (qh_xcpzzsh.shbbh='"+qh_xcpzzsh_shbbh+"')";
	}
	qh_xcpzzsh_sqsj=request.getParameter("qh_xcpzzsh_sqsj");
	if (qh_xcpzzsh_sqsj!=null)
	{
		qh_xcpzzsh_sqsj=qh_xcpzzsh_sqsj.trim();
		if (!(qh_xcpzzsh_sqsj.equals("")))	wheresql+="  and (qh_xcpzzsh.sqsj>=TO_DATE('"+qh_xcpzzsh_sqsj+"','YYYY/MM/DD'))";
	}
	qh_xcpzzsh_sqsj=request.getParameter("qh_xcpzzsh_sqsj2");
	if (qh_xcpzzsh_sqsj!=null)
	{
		qh_xcpzzsh_sqsj=qh_xcpzzsh_sqsj.trim();
		if (!(qh_xcpzzsh_sqsj.equals("")))	wheresql+="  and (qh_xcpzzsh.sqsj<=TO_DATE('"+qh_xcpzzsh_sqsj+"','YYYY/MM/DD'))";
	}
	qh_xcpzzsh_tbr=request.getParameter("qh_xcpzzsh_tbr");
	if (qh_xcpzzsh_tbr!=null)
	{
		qh_xcpzzsh_tbr=cf.GB2Uni(qh_xcpzzsh_tbr);
		if (!(qh_xcpzzsh_tbr.equals("")))	wheresql+=" and  (qh_xcpzzsh.tbr='"+qh_xcpzzsh_tbr+"')";
	}
	qh_xcpzzsh_zznr=request.getParameter("qh_xcpzzsh_zznr");
	if (qh_xcpzzsh_zznr!=null)
	{
		qh_xcpzzsh_zznr=cf.GB2Uni(qh_xcpzzsh_zznr);
		if (!(qh_xcpzzsh_zznr.equals("")))	wheresql+=" and  (qh_xcpzzsh.zznr='"+qh_xcpzzsh_zznr+"')";
	}
	qh_xcpzzsh_sl=request.getParameter("qh_xcpzzsh_sl");
	if (qh_xcpzzsh_sl!=null)
	{
		qh_xcpzzsh_sl=qh_xcpzzsh_sl.trim();
		if (!(qh_xcpzzsh_sl.equals("")))	wheresql+=" and (qh_xcpzzsh.sl="+qh_xcpzzsh_sl+") ";
	}
	qh_xcpzzsh_gg=request.getParameter("qh_xcpzzsh_gg");
	if (qh_xcpzzsh_gg!=null)
	{
		qh_xcpzzsh_gg=cf.GB2Uni(qh_xcpzzsh_gg);
		if (!(qh_xcpzzsh_gg.equals("")))	wheresql+=" and  (qh_xcpzzsh.gg='"+qh_xcpzzsh_gg+"')";
	}
	qh_xcpzzsh_xs=request.getParameter("qh_xcpzzsh_xs");
	if (qh_xcpzzsh_xs!=null)
	{
		qh_xcpzzsh_xs=cf.GB2Uni(qh_xcpzzsh_xs);
		if (!(qh_xcpzzsh_xs.equals("")))	wheresql+=" and  (qh_xcpzzsh.xs='"+qh_xcpzzsh_xs+"')";
	}
	qh_xcpzzsh_wznr=request.getParameter("qh_xcpzzsh_wznr");
	if (qh_xcpzzsh_wznr!=null)
	{
		qh_xcpzzsh_wznr=cf.GB2Uni(qh_xcpzzsh_wznr);
		if (!(qh_xcpzzsh_wznr.equals("")))	wheresql+=" and  (qh_xcpzzsh.wznr='"+qh_xcpzzsh_wznr+"')";
	}
	qh_xcpzzsh_ysyq=request.getParameter("qh_xcpzzsh_ysyq");
	if (qh_xcpzzsh_ysyq!=null)
	{
		qh_xcpzzsh_ysyq=cf.GB2Uni(qh_xcpzzsh_ysyq);
		if (!(qh_xcpzzsh_ysyq.equals("")))	wheresql+=" and  (qh_xcpzzsh.ysyq='"+qh_xcpzzsh_ysyq+"')";
	}
	qh_xcpzzsh_qtyq=request.getParameter("qh_xcpzzsh_qtyq");
	if (qh_xcpzzsh_qtyq!=null)
	{
		qh_xcpzzsh_qtyq=cf.GB2Uni(qh_xcpzzsh_qtyq);
		if (!(qh_xcpzzsh_qtyq.equals("")))	wheresql+=" and  (qh_xcpzzsh.qtyq='"+qh_xcpzzsh_qtyq+"')";
	}
	qh_xcpzzsh_wcsj=request.getParameter("qh_xcpzzsh_wcsj");
	if (qh_xcpzzsh_wcsj!=null)
	{
		qh_xcpzzsh_wcsj=qh_xcpzzsh_wcsj.trim();
		if (!(qh_xcpzzsh_wcsj.equals("")))	wheresql+="  and (qh_xcpzzsh.wcsj=TO_DATE('"+qh_xcpzzsh_wcsj+"','YYYY/MM/DD'))";
	}
	qh_xcpzzsh_bz=request.getParameter("qh_xcpzzsh_bz");
	if (qh_xcpzzsh_bz!=null)
	{
		qh_xcpzzsh_bz=cf.GB2Uni(qh_xcpzzsh_bz);
		if (!(qh_xcpzzsh_bz.equals("")))	wheresql+=" and  (qh_xcpzzsh.bz='"+qh_xcpzzsh_bz+"')";
	}
	sq_dwxx_dwmc=request.getParameter("sq_dwxx_dwmc");
	if (sq_dwxx_dwmc!=null)
	{
		sq_dwxx_dwmc=cf.GB2Uni(sq_dwxx_dwmc);
		if (!(sq_dwxx_dwmc.equals("")))	wheresql+=" and  (sq_dwxx.dwmc='"+sq_dwxx_dwmc+"')";
	}
	qh_xcpzzsh_zgbmjlyj=request.getParameter("qh_xcpzzsh_zgbmjlyj");
	if (qh_xcpzzsh_zgbmjlyj!=null)
	{
		qh_xcpzzsh_zgbmjlyj=cf.GB2Uni(qh_xcpzzsh_zgbmjlyj);
		if (!(qh_xcpzzsh_zgbmjlyj.equals("")))	wheresql+=" and  (qh_xcpzzsh.zgbmjlyj='"+qh_xcpzzsh_zgbmjlyj+"')";
	}
	shqk=request.getParameter("shqk");
	if(shqk.equals("N"))
	{
	wheresql+=" and (trim(qh_xcpzzsh.qhbshyj) is  null)";//�󻮲�δ���
	}
	else
	{
	wheresql+=" and (trim(qh_xcpzzsh.qhbshyj) is not null)";//�󻮲������	
	}
		if (yhjs.equals("A0")||yhjs.equals("A1"))
	{

		wheresql+=" and (1=1) ";
	}
	else if (yhjs.equals("F0")||yhjs.equals("F1"))
	{ 
		wheresql+="  and ssdw='"+ssfgs+"' ";
	}
	else
	{
		wheresql+=" and (sq_dwxx.dwbh='"+dwbh+"') ";
	}

		
	ls_sql="SELECT qh_xcpzzsh.shbbh as shbbh,qh_xcpzzsh.sqsj as qh_xcpzzsh_sqsj,qh_xcpzzsh.tbr as qh_xcpzzsh_tbr,qh_xcpzzsh.scwjm,qh_xcpzzsh.zznr as qh_xcpzzsh_zznr,qh_xcpzzsh.sl as qh_xcpzzsh_sl,qh_xcpzzsh.gg as qh_xcpzzsh_gg,qh_xcpzzsh.xs as qh_xcpzzsh_xs,qh_xcpzzsh.wznr as qh_xcpzzsh_wznr,qh_xcpzzsh.ysyq as qh_xcpzzsh_ysyq,qh_xcpzzsh.qtyq as qh_xcpzzsh_qtyq,qh_xcpzzsh.wcsj as qh_xcpzzsh_wcsj,qh_xcpzzsh.bz as qh_xcpzzsh_bz,sq_dwxx.dwmc as sq_dwxx_dwmc,qh_xcpzzsh.zgbmjlyj as qh_xcpzzsh_zgbmjlyj,qh_xcpzzsh.zjlyj as qh_xcpzzsh_zjlyj  ";
	ls_sql+=" FROM qh_xcpzzsh,sq_dwxx  ";
    ls_sql+=" where qh_xcpzzsh.dwbh=sq_dwxx.dwbh and sq_dwxx.dqbm='"+dqbm+"' ";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
 
	if(shqk.equals("Y"))//�������ˣ�����������ҳ��
	{
	pageObj.initPage("","","","ysh.html");//�����˺󣬵�����ҳ��
	}
	else
	{

	pageObj.initPage("","",""," EditQh_xcpzzsh.jsp");//�����˺󣬵�����ҳ��
	}
//	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"shbbh","qh_xcpzzsh_sqsj","qh_xcpzzsh_tbr","qh_xcpzzsh_zznr","qh_xcpzzsh_sl","qh_xcpzzsh_gg","qh_xcpzzsh_xs","qh_xcpzzsh_wznr","qh_xcpzzsh_ysyq","qh_xcpzzsh_qtyq","qh_xcpzzsh_wcsj","qh_xcpzzsh_bz","sq_dwxx_dwmc","qh_xcpzzsh_zgbmjlyj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName1={"shbbh"};
	pageObj.setKey(keyName1);
   pageObj.setEditStr("���");
//�����г�������

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"shbbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/qh/xcpzzsq/ViewQh_xcpzzsh.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("shbbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//�����г�������
   coluParm=new ColuParm();//����һ���в�������
	String[] coluKey2={"shbbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey2;//�����в�����coluParm.key������
	coluParm.link="/qh/xcpzzsq/ViewFile.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("scwjm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

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
	pageObj.getDate(1);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="6%">��˱���</td>
	<td  width="6%">����ʱ��</td>
	<td  width="6%">�����</td>
	<td  width="6%">���ļ�</td>
	<td  width="6%">��������</td>
	<td  width="6%">����</td>
	<td  width="6%">���</td>
	<td  width="6%">��ʽ</td>
	<td  width="6%">��������</td>
	<td  width="6%">��ɫҪ��</td>
	<td  width="6%">����Ҫ��</td>
	<td  width="6%">���ʱ��</td>
	<td  width="6%">��ע</td>
	<td  width="6%">��λ����</td>
	<td  width="6%">���ܲ��ž������</td>
	<td  width="6%">�ܾ������</td>
</tr>
<%
	pageObj.displayDate();
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