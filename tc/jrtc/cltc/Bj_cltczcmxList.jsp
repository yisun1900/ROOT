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
	String cpbm=null;
	String cpmc=null;
	String dqbm=null;
	String jgwzbm=null;
	String xh=null;
	String gg=null;
	String ppmc=null;
	String gysmc=null;
	String lrr=null;
	String lrsj=null;

	String tcmc=null;
	tcmc=request.getParameter("tcmc");
	if (tcmc!=null)
	{
		tcmc=cf.GB2Uni(tcmc);
		if (!(tcmc.equals("")))	wheresql+=" and  (tcmc like '%"+tcmc+"%')";
	}

	cpbm=request.getParameter("cpbm");
	if (cpbm!=null)
	{
		cpbm=cf.GB2Uni(cpbm);
		if (!(cpbm.equals("")))	wheresql+=" and  (cpbm='"+cpbm+"')";
	}
	cpmc=request.getParameter("cpmc");
	if (cpmc!=null)
	{
		cpmc=cf.GB2Uni(cpmc);
		if (!(cpmc.equals("")))	wheresql+=" and  (cpmc like '%"+cpmc+"%')";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (bj_cltczcmx.dqbm='"+dqbm+"')";
	}
	jgwzbm=request.getParameter("jgwzbm");
	if (jgwzbm!=null)
	{
		jgwzbm=cf.GB2Uni(jgwzbm);
		if (!(jgwzbm.equals("")))	wheresql+=" and  (jgwzbm='"+jgwzbm+"')";
	}
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=cf.GB2Uni(xh);
		if (!(xh.equals("")))	wheresql+=" and  (xh='"+xh+"')";
	}
	gg=request.getParameter("gg");
	if (gg!=null)
	{
		gg=cf.GB2Uni(gg);
		if (!(gg.equals("")))	wheresql+=" and  (gg='"+gg+"')";
	}
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (ppmc='"+ppmc+"')";
	}
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (gysmc='"+gysmc+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tcmc,jgwzbm,cpbm,cpmc,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,lrr,lrsj,bz,dqmc  ";
	ls_sql+=" FROM bj_cltczcmx,dm_dqbm  ";
    ls_sql+=" where bj_cltczcmx.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_cltczcmx.dqbm,tcmc,jgwzbm,cpmc,xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_cltczcmxList.jsp","","","EditBj_cltczcmx.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"cpbm","cpmc","dqbm","jgwzbm","xh","gg","ppmc","gysmc","jldw","ydj","tcdj","sjzj","jsj","lrr","lrsj","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"cpbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Bj_cltczcmxList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] cpbm = request.getParameterValues("cpbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(cpbm,"cpbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from bj_cltczcmx where "+chooseitem;
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
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="6%">�ײ�����</td>
	<td  width="4%">����λ��</td>
	<td  width="8%">��Ʒ����</td>
	<td  width="6%">��Ʒ����</td>
	<td  width="8%">�ͺ�</td>
	<td  width="8%">���</td>
	<td  width="5%">Ʒ��</td>
	<td  width="11%">��Ӧ������</td>
	<td  width="4%">������λ</td>
	<td  width="4%">ԭ����</td>
	<td  width="4%">�ײ͵���</td>
	<td  width="4%">�����ۼ�</td>
	<td  width="4%">�����</td>
	<td  width="3%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="9%">��ע</td>
	<td  width="3%">����</td>
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