<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;

	String fgsbh=request.getParameter("fgsbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String gys=cf.GB2Uni(cf.getParameter(request,"gys"));


	ls_sql="SELECT '',jc_zczjx.zjxbh,DECODE(jc_zczjx.clzt,'00','¼��δ���','01','¼�����','02','��ȷ��','04','�����ѽ���','03','���ͻ�','05','�����ͻ�','30','�������','99','�˵�'),jc_zczjx.ppbm,jc_zczjx.zjxfssj,jc_zczjx.zjxcbze,jc_zczjx.zqzjxze,jc_zczjx.zjxze,jc_zczjx.clgw,jc_zczjx.ddbh,crm_khxx.khxm,crm_khxx.fwdz,TO_CHAR(jc_zczjx.zjxzkl) zjxzkl,jc_zczjx.zjxcxhdje,jc_zczjx.ztjjgw,jc_zczjx.xmzy,jc_zczjx.qrsj,zczjxyymc,DECODE(jc_zczjx.sfjs,'N','δ����','C','��ѡ�����','Y','�ѽ���','M','���������'),jc_zczjx.jissj,jc_zczjx.jisr,jc_zczjx.lrsj,DECODE(jc_zczjx.sfjrht,'Y','����','N','������') sfjrht,crm_khxx.khbh,jc_zczjx.gys,jc_zczjx.bz";
	ls_sql+=" FROM crm_khxx,jc_zczjx,jdm_zczjxyybm";
    ls_sql+=" where jc_zczjx.khbh=crm_khxx.khbh and jc_zczjx.zczjxyybm=jdm_zczjxyybm.zczjxyybm(+)";


	ls_sql+=" and jc_zczjx.clzt not in('00')";
	ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zczjx.fgsbh='"+fgsbh+"'";
	ls_sql+=" and jc_zczjx.gys='"+gys+"'";
	ls_sql+=" order by jc_zczjx.zjxfssj";

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
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/jcjj/zcdd/ViewJeJc_zcdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey2={"zjxbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey2;//�����в�����coluParm.key������
	coluParm.link="/jcjj/zccl/zjx/ViewJeJc_zczjx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("zjxbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��Ӧ����������ϸ��<%=gys%>��
  <BR>(�������ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="230%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
    <td  width="1%">&nbsp;</td>
	<td  width="3%">���������</td>
	<td  width="3%">����״̬</td>
	<td  width="4%">��Ʒ��</td>
	<td  width="3%">�������ʱ��</td>
	<td  width="3%">������</td>
	<td  width="3%">��ǰ�������ܶ�</td>
	<td  width="3%">�ۺ��������ܶ�</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="3%">�������</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="8%">���ݵ�ַ</td>
	<td  width="2%">�������ۿ�</td>
	<td  width="3%">������������</td>
	<td  width="2%">չ���Ҿӹ���</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="3%">ȷ��ʱ��</td>
	<td  width="4%">������ԭ��</td>
	<td  width="3%">�Ƿ��ѽ���</td>
	<td  width="3%">����ʱ��</td>
	<td  width="2%">������</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="2%">�����װ��ͬ</td>
	<td  width="2%">�ͻ����</td>
	<td  width="7%">��Ӧ��</td>
	<td  width="97%">��ע</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>
</body>
</html>