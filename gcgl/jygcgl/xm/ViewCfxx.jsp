<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	String sgd=request.getParameter("sgd");
	String lrsj=request.getParameter("lrsj");
	String lrsj2=request.getParameter("lrsj2");

	String ls_sql=null;

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ʩ���Ӽ���¼</font></B>
</CENTER>
<%

	ls_sql="SELECT gdm_gdjcjl.jcjlh,sgdmc,fkze,kfzs,crm_khxx.hth,crm_khxx.khxm,gdm_gdjcjl.xjr,gdm_gdjcjl.xjsj,xjlxmc,xjjgmc,DECODE(cfspbz,'2','δ����','3','����ͨ��','4','����δͨ��'),DECODE(gdm_gdjcjl.kpbz,'N','δ����','Y','�ѿ���'),DECODE(gdm_gdjcjl.jsbz,'N','δ����','Y','�ѽ���'),gdm_gdjcjl.bz,crm_khxx.fwdz,crm_khxx.sjs,crm_khxx.zjxm  ";
	ls_sql+=" FROM gdm_gdjcjl,crm_khxx,sq_sgd,kp_jclxbm,dm_jcjgbm  ";
    ls_sql+=" where gdm_gdjcjl.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and gdm_gdjcjl.khbh=crm_khxx.khbh and gdm_gdjcjl.jclxbm=kp_jclxbm.jclxbm";
	ls_sql+=" and gdm_gdjcjl.sgd='"+sgd+"' ";//FBJ12:���̲�
	ls_sql+=" and gdm_gdjcjl.jcjgbm=dm_jcjgbm.jcjgbm ";//FBJ12:���̲�
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	ls_sql+=" and (gdm_gdjcjl.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	if (lrsj2!=null)
	{
		if (!(lrsj2.equals(""))) ls_sql+=" and (gdm_gdjcjl.lrsj<=TO_DATE('"+lrsj2+"','YYYY/MM/DD'))";
	}
    ls_sql+=" order by gdm_gdjcjl.jcjlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jcjlh","gdm_gdjcjl_khbh","gdm_gdjcjl_xjr","gdm_gdjcjl_xjsj","jclxbm","dm_jcjgbm_xjjgmc","gdm_gdjcjl_lrr","gdm_gdjcjl_lrsj","gdm_gdjcjl_bz","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_khxx_sgd","crm_khxx_zjxm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jcjlh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"jcjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewGdm_gdjcjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jcjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(160);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">����¼��</td>
	<td  width="4%">ʩ����</td>
	<td  width="5%">�����ܶ�</td>
	<td  width="4%">�۷�����</td>
	<td  width="5%">��ͬ��</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="4%">�����</td>
	<td  width="5%">���ʱ��</td>
	<td  width="6%">�������</td>
	<td  width="6%">�����</td>
	<td  width="5%">������־</td>
	<td  width="4%">������־</td>
	<td  width="4%">�����־</td>
	<td  width="17%">������˵��</td>
	<td  width="13%">���ݵ�ַ</td>
	<td  width="4%">���ʦ</td>
	<td  width="4%">���̵���</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>