<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String fgs=null;
	String nian=null;
	fgs=request.getParameter("fgs");
	String ks=null;
	String js=null;
	ks=nian+"-01-01";
	js=nian+"-12-31";
	wheresql+="  and (htksrq>=TO_DATE('"+ks+"','YYYY/MM/DD'))";
	wheresql+="  and (htksrq<=TO_DATE('"+js+"','YYYY/MM/DD'))";
	ls_sql="SELECT ldhtbh,yhmc,bianhao,a.dwmc ssfgs,b.dwmc dwbh,rzsj,dm_ldhtqx.ldhtqx ldhtqx,htksrq,htdqrq,dm_ldhtlx.ldhtlx ldhtlx,rs_ldhtjl.bz   ";
	ls_sql+=" FROM rs_ldhtjl,sq_dwxx a,sq_dwxx b,dm_ldhtlx,dm_ldhtqx   ";
    ls_sql+=" where rs_ldhtjl.ssfgs=a.dwbh and rs_ldhtjl.dwbh=b.dwbh and dm_ldhtqx.ldhtqxbm=rs_ldhtjl.ldhtqx and dm_ldhtlx.ldhtlxbm=rs_ldhtjl.ldhtlx";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_ldhtjlCxList.jsp","SelectCxRs_ldhtjl.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ldhtbh","yhmc","bianhao","ssfgs","dwbh","rzsj","ldhtlx","ldhtqx","htksrq","htdqrq"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ldhtbh"};
	pageObj.setKey(keyName);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
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
	pageObj.getDate(curPage);
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">�Ͷ���ͬ���</td>
	<td  width="7%">Ա������</td>
	<td  width="7%">Ա�����</td>
	<td  width="9%">�����ֹ�˾</td>
	<td  width="9%">������λ���</td>
	<td  width="10%">��ְ����</td>
	<td  width="9%">�Ͷ���ͬ����</td>
	<td  width="10%">��ͬ��ʼ����</td>
	<td  width="10%">��ͬ��������</td>
	<td  width="8%">ǩ������</td>
	<td  width="12%">��ע</td>
</tr>
<%
	pageObj.displayDate();
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