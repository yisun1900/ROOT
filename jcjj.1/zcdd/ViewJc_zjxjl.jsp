<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String ddbh=request.getParameter("ddbh");

	ls_sql="SELECT jc_zczjx.zjxbh,DECODE(jc_zczjx.clzt,'00','¼��δ���','01','¼�������','02','��ȷ��','04','�����ѽ���','03','���ͻ�','99','�˵�'),crm_khxx.khxm,crm_khxx.fwdz,jc_zczjx.ppbm,jc_zczjx.zqzjxze,jc_zczjx.zjxze,TO_CHAR(jc_zczjx.zjxzkl) zjxzkl,jc_zczjx.zjxcxhdje,jc_zczjx.dzyy,jc_zczjx.ddbh,jc_zczjx.zcxlbm,jc_zczjx.clgw,jc_zczjx.ztjjgw,jc_zczjx.xmzy,jc_zczjx.zjxfssj,zczjxyymc,jc_zczjx.lrsj,dwmc lrbm,crm_khxx.hth,crm_khxx.khbh,jc_zczjx.ppmc,jc_zczjx.gys,jc_zczjx.bz";
	ls_sql+=" FROM crm_khxx,jc_zczjx,sq_dwxx,jdm_zczjxyybm";
    ls_sql+=" where jc_zczjx.khbh=crm_khxx.khbh and jc_zczjx.dwbh=sq_dwxx.dwbh and jc_zczjx.zczjxyybm=jdm_zczjxyybm.zczjxyybm(+)";
    ls_sql+=" and jc_zczjx.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_zczjx.lrsj desc,jc_zczjx.zjxbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ddbh","zjxbh","jc_zczjx_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","jc_zczjx_zjxbz","jc_zczjx_zjxze","jc_zczjx_clzt","jc_zczjx_lrsj","jc_zczjx_dwbh"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zjxbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"zjxbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/jcjj/zccl/zjx/ViewJc_zczjx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("zjxbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��



%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�������¼��������ţ�<%=ddbh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(330);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���������</td>
	<td  width="3%">����״̬</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="7%">���ݵ�ַ</td>
	<td  width="5%">��Ʒ��</td>
	<td  width="3%">��ǰ�������ܶ�</td>
	<td  width="3%">�ۺ��������ܶ�</td>
	<td  width="2%">�������ۿ�</td>
	<td  width="3%">������������</td>
	<td  width="10%">����ԭ��</td>
	<td  width="3%">�������</td>
	<td  width="5%">����С��</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="2%">չ���Ҿӹ���</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="3%">�������ʱ��</td>
	<td  width="4%">������ԭ��</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="4%">¼�벿��</td>
	<td  width="3%">��ͬ��</td>
	<td  width="2%">�ͻ����</td>
	<td  width="4%">Ʒ��</td>
	<td  width="8%">��Ӧ��</td>
	<td  width="13%">��ע</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
%> 

</body>
</html>