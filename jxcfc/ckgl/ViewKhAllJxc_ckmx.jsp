<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���ⵥ��ϸ����ѯ </font></B>
</CENTER>

<table border="1" width="340%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">�ͻ����</td>
	<td  width="3%">��ͬ��</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="2%">ʩ����</td>
	<td  width="7%">���ݵ�ַ</td>
	<td  width="3%">��������</td>
	<td  width="2%">���</td>
	<td  width="3%">�ڲ�����</td>
	<td  width="6%">��������</td>
	<td  width="3%">�ͺ�</td>
	<td  width="4%">���</td>
	<td  width="4%">���ϱ���</td>
	<td  width="4%">���ϴ���</td>
	<td  width="4%">����С��</td>
	<td  width="2%">������λ</td>
	<td  width="3%">����</td>
	<td  width="3%">��������</td>
	<td  width="4%">������</td>
	<td  width="4%">Ʒ��</td>
	<td  width="7%">��Ӧ��</td>
	<td  width="4%">����ֿ�</td>
	<td  width="4%">�������</td>
	<td  width="3%">���ⵥ״̬</td>
	<td  width="3%">¼������</td>
	<td  width="3%">����ʱ��</td>
	<td  width="3%">�ƻ��ͻ�ʱ��</td>
	<td  width="3%">��Դ����</td>
	<td  width="4%">ǩ������</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	String wheresql="";

	String khbh=request.getParameter("khbh");

	ls_sql="SELECT jxc_ckd.khbh,crm_khxx.hth,crm_khxx.khxm,sq_sgd.sgdmc,crm_khxx.fwdz,jxc_ckmx.ckph,TO_CHAR(jxc_ckmx.ckxh),jxc_ckmx.nbbm,jxc_ckmx.clmc,jxc_ckmx.xh,jxc_ckmx.gg,jxc_ckmx.clbm,jxc_ckmx.cldlbm,jxc_ckmx.clxlbm,jxc_ckmx.jldwbm,TO_CHAR(jxc_ckmx.ckdj),jxc_ckmx.cksl,jxc_ckmx.ckje,jxc_ckmx.ppmc,jxc_ckmx.gysmc,ckmc,hjmc,DECODE(jxc_ckd.ckdzt,'0','δ�ύ','1','�ȴ��������','2','�ȴ��˻����','3','�ȴ��������','4','�ѽ���','5','�˻����ͨ��','6','�������δͨ��','7','�˻����δͨ��','8','���ͨ��','9','�ύ'),jxc_ckd.lrsj,jxc_ckd.cksj,jxc_ckd.jhshsj,jxc_ckd.lydh,dwmc ";
	ls_sql+=" FROM jxc_ckd,jxc_ckmx,crm_khxx,sq_sgd,sq_dwxx,jxc_ckmc,jxc_hjmc  ";
	ls_sql+=" where jxc_ckmx.ckph=jxc_ckd.ckph(+) and jxc_ckd.khbh=crm_khxx.khbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and jxc_ckmx.ckbh=jxc_ckmc.ckbh(+)";
	ls_sql+=" and jxc_ckmx.hjbh=jxc_hjmc.hjbh(+)";
	ls_sql+=" and jxc_ckd.ckdzt='9' ";//9���ύ
	ls_sql+=" and jxc_ckd.cklx in('P','J') ";//P�����ϵ����⣻J������ȯ����
	ls_sql+="  and jxc_ckd.khbh='"+khbh+"'";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(2000);


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ckph"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewJxc_ckd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ckph",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%> 
</table>

</body>
</html>