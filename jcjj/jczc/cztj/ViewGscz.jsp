<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String nian=request.getParameter("nian");
	String yue=request.getParameter("yue");
	String fgs=request.getParameter("fgs");

	ls_sql="SELECT khbh,khxm,fwdz,lxfs,qye,a.dwmc qydm,qyrq,sjkgrq,sjjgrq,sgdmc sgd,sjs,zjxm";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and zt='2'";
 	ls_sql+=" and TO_CHAR(qyrq,'YYYY')='"+nian+"'";
	ls_sql+=" and TO_CHAR(qyrq,'MM')='"+yue+"'";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	ls_sql+=" order by crm_khxx.dwbh,qyrq";

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
  <B><font size="3">ҵ����������
  <BR>(<%=nian%>��<%=yue%>��)</font></b>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">�ͻ����</td>
	<td  width="5%">����</td>
	<td  width="23%">���ݵ�ַ</td>
	<td  width="11%">��ϵ��ʽ</td>
	<td  width="8%">����ǩԼ��</td>
	<td  width="10%">ǩԼ����</td>
	<td  width="7%">ǩԼ����</td>
	<td  width="7%">ʵ��������</td>
	<td  width="7%">ʵ��������</td>
	<td  width="5%">ʩ����</td>
	<td  width="5%">���ʦ</td>
	<td  width="5%">�ʼ�Ա</td>
</tr>
<%
	pageObj.displayDateSum();
%> 
</table>
</body>
</html>