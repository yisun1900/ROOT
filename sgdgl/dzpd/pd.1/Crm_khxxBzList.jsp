<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String wheresql="";
	String wheresql1="";
	String ls_sql=null;
	String sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		if (!(sgd.equals("")))	wheresql+=" and  (d.sgd='"+sgd+"')";
		if (!(sgd.equals("")))	wheresql1+=" and  (c.sgd='"+sgd+"')";
	}
	String sgbz=request.getParameter("sgbz");
	if (sgbz!=null)
	{
		if (!(sgbz.equals("")))	wheresql+=" and  (d.sgbz='"+sgbz+"')";
		if (!(sgbz.equals("")))	wheresql1+=" and  (c.sgbz='"+sgbz+"')";
	}
	String cqbm=request.getParameter("cqbm");
	if (cqbm!=null)
	{
		if (!(cqbm.equals("")))	wheresql+=" and  (d.cqbm='"+cqbm+"')";
		if (!(cqbm.equals("")))	wheresql1+=" and  (c.cqbm='"+cqbm+"')";
	}
	String fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		if (!(fwdz.equals("")))	wheresql+=" and  (d.fwdz like '%"+fwdz+"%')";
		if (!(fwdz.equals("")))	wheresql1+=" and  (c.fwdz like '%"+fwdz+"%')";
	}

	ls_sql="SELECT sgbz";
	ls_sql+=" ,(select count(*) from crm_khxx c where c.sgbz=d.sgbz and c.zt='2' and c.wgbz='N' ) zsl";
	ls_sql+=" ,(select sum(qye) from crm_khxx c where c.sgbz=d.sgbz and c.zt='2' and c.wgbz='N' ) zje";
	ls_sql+=" ,a.dwmc sgdmc,khbh,cqmc,fwdz,qye,TO_CHAR(pmjj),sjs,zjxm,gcjdmc,sjkgrq,sjzkrq";
	ls_sql+=" FROM crm_khxx d,sq_sgd a,dm_gcjdbm,dm_cqbm  ";
    ls_sql+=" where d.sgd=a.sgd and zt='2' and wgbz='N'";
    ls_sql+=" and d.gcjdbm=dm_gcjdbm.gcjdbm(+) ";
	ls_sql+=" and d.cqbm=dm_cqbm.cqbm ";
    ls_sql+=wheresql;
    ls_sql+=" order by zje,sgbz,a.sgdmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sgbz","1");//�в����������Hash��
	spanColHash.put("zsl","1");//�в����������Hash��
	spanColHash.put("zje","1");//�в����������Hash��
	spanColHash.put("sgdmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
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
  <B><font size="3">������ʩ����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">����</td>
	<td  width="4%">����</td>
	<td  width="4%">�ܶ�</td>
	<td  width="5%">ʩ����</td>
	<td  width="7%">�ͻ����</td>
	<td  width="6%">����</td>
	<td  width="18%">���ݵ�ַ</td>
	<td  width="7%">ǩԼ��</td>
	<td  width="5%">����</td>
	<td  width="5%">���ʦ</td>
	<td  width="5%">�ʼ�</td>
	<td  width="10%">���̽���</td>
	<td  width="9%">��������</td>
	<td  width="9%">���ڿ�����</td>
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