<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String dwbh=request.getParameter("dwbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String clgw=cf.GB2Uni(cf.getParameter(request,"clgw"));
	

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");



	ls_sql="SELECT '',crm_zxkhxx.khbh,khxm,fwdz,crm_zxkhxx.sjs,crm_zxkhxx.clgw,crm_zxkhxx.khjl,crm_zxkhxx.lfdj,crm_zxkhxx.jlfdjsj,crm_zxkhxx.hddj,crm_zxkhxx.jhddjsj,crm_zxkhxx.sjf,crm_zxkhxx.jsjfsj,crm_zxkhxx.hth,TO_CHAR(sjhtje),qsjhtsj,TO_CHAR(fwmj),DECODE(sjfbz,'N','δ����Ʒ�','Y','�ѽ���','T','����Ʒ�'),crm_zxkhxx.lrsj,sczbjsj,zjsmsj,smcs";
	ls_sql+=" FROM crm_zxkhxx ";
	ls_sql+=" where crm_zxkhxx.zxdm='"+dwbh+"'";
	ls_sql+=" and crm_zxkhxx.zxzt in('0','1','5')";
	ls_sql+=" and  crm_zxkhxx.clgw='"+clgw+"'";

	ls_sql+=" and  (";

	ls_sql+=" ( crm_zxkhxx.lfdjbz='Y'";//N��δ������Y���ѽ�����T���˶���
	ls_sql+=" and  crm_zxkhxx.lfdj>0";
	ls_sql+=" and crm_zxkhxx.jlfdjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.jlfdjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" )";

	ls_sql+=" or ";

	ls_sql+=" ( crm_zxkhxx.hddjbz='Y'";//N��δ������Y���ѽ�����T���˶���
	ls_sql+=" and  crm_zxkhxx.hddj>0";
	ls_sql+=" and crm_zxkhxx.jhddjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.jhddjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" )";

	ls_sql+=" or ";

	ls_sql+=" ( crm_zxkhxx.sjfbz='Y'";//N��δ����Ʒѣ�Y���ѽ���Ʒѣ�T������Ʒ�
	ls_sql+=" and crm_zxkhxx.sjf>0";
	ls_sql+=" and crm_zxkhxx.jsjfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.jsjfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" )";
	
	ls_sql+=" )";

	ls_sql+=" order by crm_zxkhxx.khbh ";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">����Ա����<%=dwmc%>:<%=clgw%>��
  <BR>(����ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="4%">�ͻ����</td>
	<td  width="4%">����</td>
	<td  width="11%">���ݵ�ַ</td>
	<td  width="4%">���ʦ</td>
	<td  width="4%">����Ա</td>
	<td  width="4%">�ͻ�����</td>

	<td  width="4%">��װ����</td>
	<td  width="5%">����װ����ʱ��</td>
	<td  width="4%">�ײ���������</td>
	<td  width="5%">���ײͶ���ʱ��</td>
	<td  width="4%">��Ʒ�</td>
	<td  width="5%">����Ʒ�ʱ��</td>

	<td  width="5%">��ƺ�ͬ��</td>
	<td  width="4%">��ƺ�ͬ���</td>
	<td  width="5%">ǩ��ƺ�ͬʱ��</td>
	<td  width="3%">�������</td>
	<td  width="5%">������Ʒ�</td>
	<td  width="5%">���ʱ��</td>
	<td  width="5%">�״�������ʱ��</td>
	<td  width="5%">�������ʱ��</td>
	<td  width="3%">���Ŵ���</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>
</body>
</html>