<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;

	String ddbh=null;
	ddbh=request.getParameter("ddbh");



	ls_sql="SELECT a.fklxmc fklxbm,cw_khfkjl.fkxh,cw_khfkjl.gysbh,cw_khfkjl.ddbh,cw_khfkjl.fkje,zffsmc,b.fklxmc zckx,cw_khfkjl.zcgysbh,cw_khfkjl.zcddbh,DECODE(skdd,'1','�������','2','�����'),DECODE(dsksjbz,'N','δ���','Y',' ���ͨ��','M','���δͨ��'),cw_khfkjl.sjbh,cw_khfkjl.skr,cw_khfkjl.sksj,dwmc,cw_khfkjl.sjr,cw_khfkjl.sjsj,DECODE(scbz,'N','δɾ��','Y','ɾ��'),scr,scsj,DECODE(cw_khfkjl.gljlbz,'N','�ǹ���','Y','����'),cw_khfkjl.glxh,cw_khfkjl.shyj,cw_khfkjl.bz  ";
	ls_sql+=" FROM cw_khfkjl,sq_dwxx,cw_fklxbm a,cw_fklxbm b,cw_zffsbm ";
	ls_sql+=" where cw_khfkjl.skdw=sq_dwxx.dwbh(+) and cw_khfkjl.fklxbm=a.fklxbm(+)";
	ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm(+) and cw_khfkjl.zckx=b.fklxbm(+)";
	ls_sql+=" and  (cw_khfkjl.ddbh='"+ddbh+"')";


    ls_sql+=" order by fklxbm,fkxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);
/*
//������ʾ��
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","fkxh","cw_khfkjl_sjbh","cw_khfkjl_jsjlh","cw_khfkjl_fklx","cw_khfkjl_fkje","cw_khfkjl_skr","cw_khfkjl_sksj","cw_khfkjl_lrdw","cw_khfkjl_bz"};
	pageObj.setDisColName(disColName);
*/

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
  <B><font size="3">����������Ϣ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">�տ�����</td>
	<td  width="3%">�տ����</td>
	<td  width="4%">�տ�Ʒ��</td>
	<td  width="4%">�տ�����</td>
	<td  width="4%">ʵ�տ���</td>
	<td  width="3%">֧����ʽ</td>
	<td  width="3%">ת�ʿ���</td>
	<td  width="4%">ת��Ʒ��</td>
	<td  width="4%">ת�ʶ������</td>
	<td  width="3%">�Ƿ������</td>
	<td  width="3%">��˱�־</td>
	<td  width="5%">�վݱ��</td>
	<td  width="2%">�տ���</td>
	<td  width="3%">�տ�ʱ��</td>
	<td  width="4%">�տλ</td>
	<td  width="2%">�����</td>
	<td  width="3%">���ʱ��</td>
	<td  width="2%">ɾ����־</td>
	<td  width="2%">ɾ����</td>
	<td  width="3%">ɾ��ʱ��</td>
	<td  width="2%">������¼��־</td>
	<td  width="2%">�������</td>
	<td  width="11%">������</td>
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