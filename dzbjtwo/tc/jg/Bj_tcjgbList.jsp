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
	String bj_tcjgb_bjbbh=null;
	String bj_tcjgb_dqbm=null;
	String bj_tcjgb_bjjbbm=null;
	String bj_tcjgb_hxbm=null;
	String bj_tcjgb_tcmc=null;
	bj_tcjgb_bjbbh=request.getParameter("bj_tcjgb_bjbbh");
	if (bj_tcjgb_bjbbh!=null)
	{
		bj_tcjgb_bjbbh=cf.GB2Uni(bj_tcjgb_bjbbh);
		if (!(bj_tcjgb_bjbbh.equals("")))	wheresql+=" and  (bj_tcjgb.bjbbh='"+bj_tcjgb_bjbbh+"')";
	}
	bj_tcjgb_dqbm=request.getParameter("bj_tcjgb_dqbm");
	if (bj_tcjgb_dqbm!=null)
	{
		bj_tcjgb_dqbm=cf.GB2Uni(bj_tcjgb_dqbm);
		if (!(bj_tcjgb_dqbm.equals("")))	wheresql+=" and  (bj_tcjgb.dqbm='"+bj_tcjgb_dqbm+"')";
	}
	bj_tcjgb_bjjbbm=request.getParameter("bj_tcjgb_bjjbbm");
	if (bj_tcjgb_bjjbbm!=null)
	{
		bj_tcjgb_bjjbbm=cf.GB2Uni(bj_tcjgb_bjjbbm);
		if (!(bj_tcjgb_bjjbbm.equals("")))	wheresql+=" and  (bj_tcjgb.bjjbbm='"+bj_tcjgb_bjjbbm+"')";
	}
	bj_tcjgb_hxbm=request.getParameter("bj_tcjgb_hxbm");
	if (bj_tcjgb_hxbm!=null)
	{
		bj_tcjgb_hxbm=cf.GB2Uni(bj_tcjgb_hxbm);
		if (!(bj_tcjgb_hxbm.equals("")))	wheresql+=" and  (bj_tcjgb.hxbm='"+bj_tcjgb_hxbm+"')";
	}
	bj_tcjgb_tcmc=request.getParameter("bj_tcjgb_tcmc");
	if (bj_tcjgb_tcmc!=null)
	{
		bj_tcjgb_tcmc=cf.GB2Uni(bj_tcjgb_tcmc);
		if (!(bj_tcjgb_tcmc.equals("")))	wheresql+=" and  (bj_tcjgb.tcmc='"+bj_tcjgb_tcmc+"')";
	}
	ls_sql="SELECT bj_tcjgb.bjbbh,bj_tcjgb.dqbm,dm_dqbm.dqmc,bj_tcjgb.bjjbbm,bjjbmc,bj_tcjgb.hxbm,hxmc,bj_tcjgb.tcmc,bj_tcjgb.fwmj,bj_tcjgb.tcjg,bj_tcjgb.pmzjdj,bj_tcjgb.tlgbzjj  ";
	ls_sql+=" FROM bj_tcjgb,dm_dqbm,bdm_bjjbbm,dm_hxbm  ";
    ls_sql+=" where bj_tcjgb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_tcjgb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_tcjgb.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_tcjgb.bjbbh,bj_tcjgb.dqbm,bj_tcjgb.bjjbbm,bj_tcjgb.hxbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_tcjgbList.jsp","","","EditBj_tcjgb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"bjbbh","dqmc","bjjbmc","hxmc","tcmc","fwmj","tcjg","pmzjdj","tlgbzjj"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"bjbbh","dqbm","bjjbbm","hxbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Bj_tcjgbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
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
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from bj_tcjgb where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�ײͼ۸��ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="10%">���۰汾��</td>
	<td  width="10%">����</td>
	<td  width="12%">���ۼ���</td>
	<td  width="12%">����</td>
	<td  width="12%">�ײ�����</td>
	<td  width="9%">���ڻ�׼���</td>
	<td  width="9%">�ײͼ۸�</td>
	<td  width="9%">ƽ�����ӵ���</td>
	<td  width="9%">Ϳ�ϸ�Ϊ��ֽ�Ӽ�</td>
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