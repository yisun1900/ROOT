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
	String bj_dzbjbb_dqbm=null;
	String bj_dzbjbb_bjbbh=null;
	String bj_dzbjbb_qysj=null;
	String bj_dzbjbb_sfzybb=null;
	bj_dzbjbb_dqbm=request.getParameter("bj_dzbjbb_dqbm");
	if (bj_dzbjbb_dqbm!=null)
	{
		bj_dzbjbb_dqbm=cf.GB2Uni(bj_dzbjbb_dqbm);
		if (!(bj_dzbjbb_dqbm.equals("")))	wheresql+=" and  (bj_dzbjbb.dqbm='"+bj_dzbjbb_dqbm+"')";
	}
	bj_dzbjbb_bjbbh=request.getParameter("bj_dzbjbb_bjbbh");
	if (bj_dzbjbb_bjbbh!=null)
	{
		bj_dzbjbb_bjbbh=cf.GB2Uni(bj_dzbjbb_bjbbh);
		if (!(bj_dzbjbb_bjbbh.equals("")))	wheresql+=" and  (bj_dzbjbb.bjbbh='"+bj_dzbjbb_bjbbh+"')";
	}
	bj_dzbjbb_qysj=request.getParameter("bj_dzbjbb_qysj");
	if (bj_dzbjbb_qysj!=null)
	{
		bj_dzbjbb_qysj=bj_dzbjbb_qysj.trim();
		if (!(bj_dzbjbb_qysj.equals("")))	wheresql+="  and (bj_dzbjbb.qysj>=TO_DATE('"+bj_dzbjbb_qysj+"','YYYY/MM/DD'))";
	}
	bj_dzbjbb_qysj=request.getParameter("bj_dzbjbb_qysj2");
	if (bj_dzbjbb_qysj!=null)
	{
		bj_dzbjbb_qysj=bj_dzbjbb_qysj.trim();
		if (!(bj_dzbjbb_qysj.equals("")))	wheresql+="  and (bj_dzbjbb.qysj<=TO_DATE('"+bj_dzbjbb_qysj+"','YYYY/MM/DD'))";
	}
	bj_dzbjbb_sfzybb=request.getParameter("bj_dzbjbb_sfzybb");
	if (bj_dzbjbb_sfzybb!=null)
	{
		bj_dzbjbb_sfzybb=cf.GB2Uni(bj_dzbjbb_sfzybb);
		if (!(bj_dzbjbb_sfzybb.equals("")))	wheresql+=" and  (bj_dzbjbb.sfzybb='"+bj_dzbjbb_sfzybb+"')";
	}
	ls_sql="SELECT bj_dzbjbb.dqbm,dm_dqbm.dqmc,bj_dzbjbb.bjbbh,bj_dzbjbb.qysj,bj_dzbjbb.yxq,DECODE(bj_dzbjbb.sfzybb,'1','δ����','2','��ǰ��','3','���ð�','4','ͣ��'),bj_dzbjbb.bz  ";
	ls_sql+=" FROM dm_dqbm,bj_dzbjbb  ";
    ls_sql+=" where bj_dzbjbb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_dzbjbb.dqbm,bj_dzbjbb.qysj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_dzbjbbCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dqbm","dm_dqbm_dqmc","bjbbh","bj_dzbjbb_qysj","bj_dzbjbb_sfyqy","bj_dzbjbb_sfzybb","bj_dzbjbb_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"dqbm","bjbbh"};
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
  <B><font size="3">��ѯ���۰汾</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">��������</td>
	<td  width="10%">��������</td>
	<td  width="23%">���۰汾��</td>
	<td  width="10%">����ʱ��</td>
	<td  width="10%">��Ч��</td>
	<td  width="7%">�Ƿ����ð汾</td>
	<td  width="32%">��ע</td>
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