<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	String wheresql="";

	String sgd=request.getParameter("sgd");
	String tjsj=request.getParameter("tjsj");
	String tjsj2=request.getParameter("tjsj2");
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�ͻ����ϵ�ͳ��</font></B>
<BR>¼�����ڣ���<%=tjsj%>����<%=tjsj2%>��
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
	<td  width="4%">���</td>
	<td  width="3%">��������</td>
	<td  width="4%">Ʒ��</td>
	<td  width="7%">��Ӧ��</td>
	<td  width="3%">���ⵥ״̬</td>
	<td  width="3%">¼������</td>
	<td  width="3%">���ʱ��</td>
	<td  width="3%">�ƻ��ͻ�ʱ��</td>
	<td  width="4%">ǩ������</td>
</tr>
<%

	ls_sql="SELECT jxc_clpsd.khbh,crm_khxx.hth,crm_khxx.khxm,sq_sgd.sgdmc,crm_khxx.fwdz,jxc_clpsmx.psph,TO_CHAR(jxc_clpsmx.psxh),jxc_clpsmx.nbbm,jxc_clpsmx.clmc,jxc_clpsmx.xh,jxc_clpsmx.gg,jxc_clpsmx.clbm,jxc_clpsmx.cldlbm,jxc_clpsmx.clxlbm,jxc_clpsmx.jldwbm,TO_CHAR(jxc_clpsmx.dj),jxc_clpsmx.pssl,jxc_clpsmx.psje,jxc_clpsmx.cksl,jxc_clpsmx.ppmc,jxc_clpsmx.gysmc,DECODE(jxc_clpsd.psdzt,'0','�ȴ��ύ','1','�ȴ����','2','�ȴ�����','3','�ѳ���','5','���ֳ���','6','���������޸�','7','����') psdzt,jxc_clpsd.lrrq,jxc_clpsd.shsj,jxc_clpsd.jhshsj,dwmc ";
	ls_sql+=" FROM jxc_clpsd,jxc_clpsmx,crm_khxx,sq_sgd,sq_dwxx ";
	ls_sql+=" where jxc_clpsmx.psph=jxc_clpsd.psph(+) and jxc_clpsd.khbh=crm_khxx.khbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and jxc_clpsd.psdzt in('2','3','5') ";//0���ȴ��ύ��1���ȴ���ˣ�2���ȴ����⣻3���ѳ��⣻5�����ֳ��⣻6�����������޸ģ�7������
	ls_sql+="  and (jxc_clpsd.lrrq>=TO_DATE('"+tjsj+"','YYYY/MM/DD'))";
	ls_sql+="  and (jxc_clpsd.lrrq<=TO_DATE('"+tjsj2+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	ls_sql+="  and crm_khxx.sgd='"+sgd+"'";
	ls_sql+=" order by jxc_clpsmx.psph,jxc_clpsmx.psxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(2000);


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"psph"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewJxc_clpsd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("psph",coluParm);//�в����������Hash��
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