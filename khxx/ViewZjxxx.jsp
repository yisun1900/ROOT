<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String khbh=request.getParameter("khbh");
	String ls_sql=null;
%>

<body bgcolor="#FFFFFF">

<div align="center">��������Ϣ(�ͻ���ţ�<%=khbh%>) </div>
<table width="220%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���������</td>
	<td  width="3%">���</td>
	<td  width="2%">״̬</td>
	<td  width="4%">����</td>
	<td  width="4%">�����ܶ��ǰ</td>
	<td  width="4%">�����ܶ�ۺ�</td>
	<td  width="4%">�������̷ѣ���ǰ</td>
	<td  width="4%">�������̷ѣ��ۺ�</td>
	<td  width="4%">��������ѣ���ǰ</td>
	<td  width="4%">��������ѣ��ۺ�</td>
	<td  width="4%">����˰����ǰ</td>
	<td  width="4%">����˰���ۺ�</td>
	<td  width="3%">����ҵ�������ѣ���ǰ</td>
	<td  width="3%">����ҵ�������ѣ��ۺ�</td>
	<td  width="3%">����ҵ�������ѣ���ǰ</td>
	<td  width="3%">����ҵ�������ѣ��ۺ�</td>
	<td  width="3%">��Ʒѣ���ǰ</td>
	<td  width="3%">��Ʒѣ��ۺ�</td>
	<td  width="3%">�۹����</td>
	<td  width="3%">��������</td>
	<td  width="3%">�����׶�</td>
	<td  width="4%">�������ʱ��</td>
	<td  width="3%">¼����</td>
	<td  width="4%">��ͬ��</td>
	<td  width="27%">������ԭ��</td>
</tr>

<%

	ls_sql="SELECT  crm_zjxdj.zjxxh,DECODE(crm_zjxdj.shbz,'N','δ���','Y','���ͨ��','S','���δͨ��','M','�������'),DECODE(crm_zjxdj.sfwc,'N','δ���','Y','�����'),DECODE(crm_zjxdj.lx,'1','����������','2','��������������ϸ','3','�ײ��˲���','4','�ײ͵�����Ʒ'),crm_zjxdj.zqzjze,crm_zjxdj.zhzjze,crm_zjxdj.zjje,crm_zjxdj.jzjje,crm_zjxdj.zqguanlif,crm_zjxdj.zhguanlif,crm_zjxdj.zqzjxsuijin,crm_zjxdj.zjxsuijin,crm_zjxdj.zqqtsf,crm_zjxdj.zhqtsf,crm_zjxdj.zqwjrqyexm,crm_zjxdj.zhwjrqyexm,crm_zjxdj.zqsjf,crm_zjxdj.zhsjf,crm_zjxdj.kglf,crm_zjxdj.kqtk,zjxfsjdmc,fssj,crm_zjxdj.lrr,hth,crm_zjxdj.zjxyysm ";
	ls_sql+=" FROM crm_zjxdj,crm_khxx,dm_zjxfsjd  ";
    ls_sql+=" where crm_zjxdj.khbh=crm_khxx.khbh ";
    ls_sql+=" and crm_zjxdj.zjxfsjd=dm_zjxfsjd.zjxfsjd(+)";
    ls_sql+=" and crm_zjxdj.khbh='"+khbh+"'";
    ls_sql+=" order by crm_zjxdj.zjxxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��


	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"zjxxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/gcgl/zjx/ViewCrm_zjxdj.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("zjxxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%>
</table>


</body>
</html>
