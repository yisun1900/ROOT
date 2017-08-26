<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql=request.getParameter("wheresql");
	String nian=request.getParameter("nian");
	String yue=request.getParameter("yue");


	ls_sql="SELECT distinct crm_khxx.khbh,hth,khxm,fwdz,dwmc,sgdmc,sgbz,sjs,zjxm,kgrq,jgrq ";
	ls_sql+=" FROM crm_khpjb,crm_khxx,sq_dwxx,sq_sgd ";
    ls_sql+=" where crm_khpjb.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
	ls_sql+=" and crm_khpjb.xmflbm='07'";
	ls_sql+=" and TO_CHAR(crm_khpjb.lrsj,'YYYY')='"+nian+"' and TO_CHAR(crm_khpjb.lrsj,'MM')='"+yue+"'";
    ls_sql+=wheresql;


    pageObj.sql=ls_sql;
//	out.println(ls_sql);

//���ж����ʼ��
	pageObj.initPage("","","/gcgl/wgpjd/khpj/ViewCrm_khpjb.jsp","");
	pageObj.setPageRow(300);//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setEditBolt("");

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
  <B><font size="3">�ͻ����۱�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="6%">�ͻ����</td>
	<td  width="8%">��ͬ��</td>
	<td  width="6%">����</td>
	<td  width="18%">���ݵ�ַ</td>
	<td  width="11%">ǩԼ����</td>
	<td  width="6%">ʩ����</td>
	<td  width="6%">�೤</td>
	<td  width="6%">���ʦ</td>
	<td  width="6%">���̵���</td>
	<td  width="9%">��ͬ��������</td>
	<td  width="9%">��ͬ�깤����</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>

</html>