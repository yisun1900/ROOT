<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String sq_sgcqxx_dwbh=null;
	sq_sgcqxx_dwbh=request.getParameter("dwbh");
	if (sq_sgcqxx_dwbh!=null)
	{
		sq_sgcqxx_dwbh=cf.GB2Uni(sq_sgcqxx_dwbh);
		if (!(sq_sgcqxx_dwbh.equals("")))	wheresql+=" and  (sq_sgcqxx.dwbh='"+sq_sgcqxx_dwbh+"')";
	}
	ls_sql="SELECT sq_sgcqxx.dwbh,sq_dwxx.dwmc,sq_sgcqxx.cqbm,dm_cqbm.cqmc  ";
	ls_sql+=" FROM dm_cqbm,sq_dwxx,sq_sgcqxx  ";
    ls_sql+=" where sq_sgcqxx.cqbm=dm_cqbm.cqbm and sq_sgcqxx.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditSq_sgcqxx.jsp");
	pageObj.setPageRow(40000);
/*
//������ʾ��
	String[] disColName={"dwbh","sq_dwxx_dwmc","cqbm","dm_cqbm_cqmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"dwbh","cqbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteSq_sgcqxx.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="12%">��λ���</td>
	<td  width="22%">��λ����</td>
	<td  width="12%">��������</td>
	<td  width="22%">��������</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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