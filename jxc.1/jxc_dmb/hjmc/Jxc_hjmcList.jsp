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
	String hjbh=null;
	String hjmc=null;
	String ckbh=null;
	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (jxc_ckmc.dqbm='"+dqbm+"')";
	}
	hjbh=request.getParameter("hjbh");
	if (hjbh!=null)
	{
		hjbh=cf.GB2Uni(hjbh);
		if (!(hjbh.equals("")))	wheresql+=" and  (hjbh='"+hjbh+"')";
	}
	hjmc=request.getParameter("hjmc");
	if (hjmc!=null)
	{
		hjmc=cf.GB2Uni(hjmc);
		if (!(hjmc.equals("")))	wheresql+=" and  (hjmc='"+hjmc+"')";
	}
	ckbh=request.getParameter("ckbh");
	if (ckbh!=null)
	{
		ckbh=cf.GB2Uni(ckbh);
		if (!(ckbh.equals("")))	wheresql+=" and  (jxc_hjmc.ckbh='"+ckbh+"')";
	}
	ls_sql="SELECT hjbh,hjmc,ckmc,dqmc  ";
	ls_sql+=" FROM jxc_hjmc,jxc_ckmc,dm_dqbm  ";
    ls_sql+=" where jxc_hjmc.ckbh=jxc_ckmc.ckbh and jxc_ckmc.dqbm=dm_dqbm.dqbm ";
    ls_sql+=wheresql;
	ls_sql+=" order by dqmc,ckmc,hjmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_hjmcList.jsp","SelectJxc_hjmc.jsp","ViewJxc_hjmc.jsp","EditJxc_hjmc.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"hjbh","hjmc","ckbh"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"hjbh"};
	pageObj.setKey(keyName);
	//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dqmc","1");//�в����������Hash��
	spanColHash.put("ckmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jxc_hjmcList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] hjbh = request.getParameterValues("hjbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(hjbh,"hjbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jxc_hjmc where "+chooseitem;
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
  <B><font size="3">��ѯ���</font></B>
  <br>&nbsp;<br>
  <font color="red">ɾ���ֿ���ʾ�����ǲ�������ִ���޸ġ�ɾ��������������ɲ��϶�ʧ�������ң�����</font>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="20%">���ܱ��</td>
	<td  width="20%">��������</td>
	<td  width="20%">�����ֿ�</td>
	<td  width="20%">��������</td>
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