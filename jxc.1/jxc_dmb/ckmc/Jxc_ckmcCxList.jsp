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
	String ckbh=null;
	String ckmc=null;
	String dqbm=null;
	String cksslx=null;
	cksslx=request.getParameter("cksslx");
	if (cksslx!=null)
	{
		cksslx=cf.GB2Uni(cksslx);
		if (!(cksslx.equals("")))	wheresql+=" and  (cksslx='"+cksslx+"')";
	}
	ckbh=request.getParameter("ckbh");
	if (ckbh!=null)
	{
		ckbh=cf.GB2Uni(ckbh);
		if (!(ckbh.equals("")))	wheresql+=" and  (ckbh='"+ckbh+"')";
	}
	ckmc=request.getParameter("ckmc");
	if (ckmc!=null)
	{
		ckmc=cf.GB2Uni(ckmc);
		if (!(ckmc.equals("")))	wheresql+=" and  (ckmc='"+ckmc+"')";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (jxc_ckmc.dqbm='"+dqbm+"')";
	}
	ls_sql="SELECT dqmc,ckmc,ckbh,DECODE(cksslx,'1','�ֹ�˾�ֿ�','0','�ܲ��ֿ�') cksslx  ";
	ls_sql+=" FROM jxc_ckmc,dm_dqbm  ";
    ls_sql+=" where jxc_ckmc.dqbm=dm_dqbm.dqbm";
    ls_sql+=wheresql;
	ls_sql+=" order by dqmc,ckmc,cksslx ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_ckmcCxList.jsp","SelectCxJxc_ckmc.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ckbh","ckmc","dqbm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ckbh"};
	pageObj.setKey(keyName);


//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dqmc","1");//�в����������Hash��
	spanColHash.put("cksslx","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="25%">��������</td>
	<td  width="25%">�ֿ�����</td>
	<td  width="25%">�ֿ���</td>
	<td  width="25%">�ֿ�����</td>
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