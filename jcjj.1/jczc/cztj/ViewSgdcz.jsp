<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String sgd=request.getParameter("sgd");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");

	String dwmc=cf.executeQuery("select sgdmc from sq_sgd where sgd='"+sgd+"'");



	ls_sql="SELECT khbh,khxm,fwdz,lxfs,qye,a.dwmc qydm,qyrq,DECODE(hdbz,'1','�ǻص�','2','���ʦ�ص�','3','ʩ���ӻص�','4','�Ͽͻ��ص�','5','Ա���ص�','6','�೤�ص�','7','��¥��','8','������','9','����'),hdr,DECODE(jlbz,'0','������','1','�ص�����','2','��˾����','3','���ʦָ���ɵ�','4','�ͻ�ָ���ɵ�','5','�󵥵�С��','6','С���ִ�','7','�������'),pdsj,pdr,pdsm,sjkgrq,sjjgrq,sgdmc sgd,sjs,zjxm";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and zt='2'";
    ls_sql+=" and crm_khxx.sgd='"+sgd+"'";
 	ls_sql+=" and pdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and pdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by pdsj";

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
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3"> ʩ���ӽӵ�ͳ�� ��<%=dwmc%>��
  <BR>(ǩԼʱ�䣺<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">�ͻ����</td>
	<td  width="4%">����</td>
	<td  width="15%">���ݵ�ַ</td>
	<td  width="9%">��ϵ��ʽ</td>
	<td  width="5%">����ǩԼ��</td>
	<td  width="8%">ǩԼ����</td>
	<td  width="5%">ǩԼ����</td>
	<td  width="4%">�ص���־</td>
	<td  width="4%">�ص���</td>
	<td  width="4%">�ɵ�����</td>
	<td  width="5%">�ɵ�ʱ��</td>
	<td  width="4%">�ɵ���</td>
	<td  width="7%">�ɵ�˵��</td>
	<td  width="5%">ʵ��������</td>
	<td  width="5%">ʵ��������</td>
	<td  width="3%">ʩ����</td>
	<td  width="3%">���ʦ</td>
	<td  width="3%">�ʼ�Ա</td>
</tr>
<%
	pageObj.displayDateSum();
%> 
</table>
</body>
</html>