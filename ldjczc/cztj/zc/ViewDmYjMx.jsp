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

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");

	ls_sql="SELECT '',cw_khfkjl.fkxh,cw_khfkjl.fkje,cw_khfkjl.sksj,cw_khfkjl.sjsj,cw_khfkjl.ddbh,cw_khfkjl.zjxbh,clztmc,DECODE(jc_zcdd.ddlx,'1','����Ʒ','3','��¼��ͬ','4','�п�涩��','5','��׼�ײ�','6','�Ҿ߽����ײ�','7','��ů�����ײ�','8','�����ײ�','9','����','A','��������','B','��������շ�','C','ѡ��','D','�ײ�������','E','ɢ��'),ppbm,jc_zcdd.wdzje,jc_zcdd.hkze,cw_khfkjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,jc_zcdd.clgw,dwmc dm,gys,jc_zcdd.qhtsj,jc_zcdd.ddqrsj,jc_zcdd.tdsj";
	ls_sql+=" FROM cw_khfkjl,crm_khxx,jc_zcdd,sq_dwxx,jdm_zcddzt ";
	ls_sql+=" where cw_khfkjl.ddbh=jc_zcdd.ddbh(+) ";
	ls_sql+=" and cw_khfkjl.khbh=crm_khxx.khbh(+) ";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";

	ls_sql+=" and cw_khfkjl.scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:����
	ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
	ls_sql+=" and cw_khfkjl.dwbh='"+dwbh+"'";

	ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

	ls_sql+=" order by jc_zcdd.ddlx,jc_zcdd.ddqrsj";

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
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey2={"zjxbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey2;//�����в�����coluParm.key������
	coluParm.link="/jcjj/zccl/zjx/ViewJc_zczjx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("zjxbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey3={"fkxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey3;//�����в�����coluParm.key������
	coluParm.link="/cwgl/qyecx/ViewCw_khfkjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("fkxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��������ʵ�տ<%=dwmc%>��
  <BR>(ʵ�տ�ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="180%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
   	<td  width="2%">&nbsp;</td>
   	<td  width="4%">�տ����</td>
	<td  width="5%" bgcolor="#99FFFF"><strong>�տ��</strong></td>
	<td  width="4%">�տ�ʱ��</td>
	<td  width="4%">���ʱ��</td>
   	<td  width="4%">�������</td>
   	<td  width="4%">��������</td>
	<td  width="4%">����״̬</td>
	<td  width="4%">��������</td>
	<td  width="5%">��Ʒ��</td>

	<td  width="5%" bgcolor="#99FFFF"><strong>��ͬ��-��ǰ</strong></td>
	<td  width="5%" bgcolor="#99FFFF"><strong><font color="#0000CC">��ͬ��-�ۺ�</font></strong></td>

	<td  width="3%">�ͻ����</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="10%">���ݵ�ַ</td>
	<td  width="3%">��װ���ʦ</td>
	<td  width="3%">�Ҿӹ���</td>
	<td  width="6%">ǩԼ����</td>


	<td  width="9%">��Ӧ��</td>
	<td  width="4%">ǩ��ͬʱ��</td>
	<td  width="4%">����ȷ��ʱ��</td>
	<td  width="4%">�˵�ʱ��</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>
</body>
</html>