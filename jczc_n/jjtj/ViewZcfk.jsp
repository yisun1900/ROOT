<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";

	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String dwbh=request.getParameter("dwbh");



	ls_sql="SELECT crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,DECODE(zt,'2','��װ�ͻ�','3','�˵��ͻ�','4','�Ǽ�װ�ͻ�','5','��ƿͻ�') zt,cw_khfkjl.fkxh,a.fklxmc fklxbm,cw_khfkjl.gysbh,cw_khfkjl.ddbh,cw_khfkjl.fkje,zffsmc,b.fklxmc zckx,cw_khfkjl.zcgysbh,cw_khfkjl.zcddbh,DECODE(skdd,'1','�������','2','�����'),DECODE(dsksjbz,'N','δ���','Y',' ���ͨ��','M','���δͨ��'),cw_khfkjl.sjbh,cw_khfkjl.skr,cw_khfkjl.sksj,dwmc,cw_khfkjl.sjr,cw_khfkjl.sjsj,DECODE(scbz,'N','δɾ��','Y','ɾ��'),scr,scsj,DECODE(cw_khfkjl.gljlbz,'N','�ǹ���','Y','����'),cw_khfkjl.glxh,cw_khfkjl.bz  ";
	ls_sql+=" FROM cw_khfkjl,crm_khxx,sq_dwxx,cw_fklxbm a,cw_fklxbm b,cw_zffsbm  ";
	ls_sql+=" where cw_khfkjl.khbh=crm_khxx.khbh(+) and cw_khfkjl.skdw=sq_dwxx.dwbh and cw_khfkjl.fklxbm=a.fklxbm";
	ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm and cw_khfkjl.zckx=b.fklxbm(+)";
	ls_sql+=" and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and (cw_khfkjl.skdd='1' OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y'))  ";
	ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and cw_khfkjl.fklxbm='23'  ";
	ls_sql+=" and cw_khfkjl.scbz='N'  ";
    ls_sql+=" order by fklxbm,fkxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);


//��������
	String[] keyName={"fkxh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"fkxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/cwgl/qyecx/ViewCw_khfkjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("fkxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"fkxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/cwgl/qyecx/ViewKhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">����ʵ�տ�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">��ͬ��</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="8%">���ݵ�ַ</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="3%">�տ����</td>
	<td  width="3%">�տ�����</td>
	<td  width="6%">�տ�Ʒ��</td>
	<td  width="3%">�տ��</td>
	<td  width="4%">ʵ�տ���</td>
	<td  width="3%">֧����ʽ</td>
	<td  width="4%">ת�ʿ���</td>
	<td  width="6%">ת��Ʒ��</td>
	<td  width="3%">ת�ʶ���</td>
	<td  width="3%">�Ƿ������</td>
	<td  width="2%">��˱�־</td>
	<td  width="5%">�վݱ��</td>
	<td  width="2%">�տ���</td>
	<td  width="3%">�տ�ʱ��</td>
	<td  width="5%">�տλ</td>
	<td  width="2%">�����</td>
	<td  width="3%">���ʱ��</td>
	<td  width="2%">ɾ����־</td>
	<td  width="2%">ɾ����</td>
	<td  width="3%">ɾ��ʱ��</td>
	<td  width="2%">������¼��־</td>
	<td  width="3%">�������</td>
	<td  width="11%">��ע</td>
</tr>
<%
	pageObj.printDateSum();
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