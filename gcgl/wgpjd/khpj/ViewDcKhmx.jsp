<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String wtbh=null;
	String dabh=null;

	String fgsbh=null;
	fgsbh=request.getParameter("fgsbh");
	if (!(fgsbh.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgsbh+"')";


	wtbh=request.getParameter("wtbh");
	if (wtbh!=null)
	{
		if (!(wtbh.equals("")))	wheresql+=" and  (crm_khdcb.wtbh='"+wtbh+"')";
	}
	dabh=request.getParameter("dabh");
	if (dabh!=null)
	{
		if (!(dabh.equals("")))	wheresql+=" and  (crm_khdcb.dabh='"+dabh+"')";
	}
	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (crm_khdcb.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	String lrsj2=null;
	lrsj2=request.getParameter("lrsj2");
	if (lrsj2!=null)
	{
		if (!(lrsj2.equals("")))	wheresql+="  and (crm_khdcb.lrsj<=TO_DATE('"+lrsj2+"','YYYY/MM/DD'))";
	}


	ls_sql="SELECT distinct crm_khxx.khbh,hth,khxm,fwdz,dwmc,sgdmc sgd,sjs,zjxm,kgrq,jgrq ";
	ls_sql+=" FROM crm_khdcb,crm_khxx,sq_dwxx,sq_sgd ";
    ls_sql+=" where crm_khdcb.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_khxx.khxm";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);

//���ж����ʼ��
	pageObj.initPage("","","/gcgl/wgpjd/khpj/ViewCrm_khpjb.jsp","");
	pageObj.setPageRow(300);//����ÿҳ��ʾ��¼��


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�ͻ������</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(105);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="7%">�ͻ����</td>
	<td  width="9%">��ͬ��</td>
	<td  width="6%">����</td>
	<td  width="23%">���ݵ�ַ</td>
	<td  width="12%">ǩԼ����</td>
	<td  width="6%">ʩ����</td>
	<td  width="6%">���ʦ</td>
	<td  width="6%">���̵���</td>
	<td  width="10%">��ͬ��������</td>
	<td  width="10%">��ͬ�깤����</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>

</html>