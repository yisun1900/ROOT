<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ddbh=request.getParameter("ddbh");
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	ls_sql="SELECT TO_CHAR(jc_cgyddmx.xh) xh,cgmc,jc_tmbj.tmmc,jdm_mbbm.mbmc,jdm_mbfbbm.mbfbmc,jdm_xtbm.xtmc,jdm_lsbm.lsmc,jdm_ctbm.ctmc,jdm_jlbm.jlmc,jc_cgyddmx.bz  ";
	ls_sql+=" FROM jc_cgyddmx,jc_tmbj,jdm_ctbm,jdm_jlbm,jdm_lsbm,jdm_mbbm,jdm_mbfbbm,jdm_tjbbm,jdm_xtbm,jc_cgjgb  ";
    ls_sql+=" where jc_cgyddmx.cgbm=jc_cgjgb.cgbm and jc_cgyddmx.jlbm=jdm_jlbm.jlbm(+) and jc_cgyddmx.ctbm=jdm_ctbm.ctbm(+)";
    ls_sql+=" and jc_cgyddmx.tjbbm=jdm_tjbbm.tjbbm(+) and jc_cgyddmx.lsbm=jdm_lsbm.lsbm(+) and jc_cgyddmx.xtbm=jdm_xtbm.xtbm(+)";
    ls_sql+=" and jc_cgyddmx.mbfbbm=jdm_mbfbbm.mbfbbm(+) and jc_cgyddmx.mbbm=jdm_mbbm.mbbm(+) and jc_cgyddmx.tmbm=jc_tmbj.tmbm(+)";
    ls_sql+=" and jc_cgyddmx.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_cgyddmx.xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_cgyddmxList.jsp?ddbh="+ddbh,"","","EditJc_cgyddmxMain.jsp");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","jc_cgyddmx_cgbm","jc_cgyddmx_dgcd","jc_cgyddmx_dggd","jc_cgyddmx_dgjs","jc_cgyddmx_dgdj","jc_cgyddmx_tdcd","jc_cgyddmx_tggd","jc_cgyddmx_tgjs","jc_tmbj_tmmc","jc_cgyddmx_tmcd","jc_cgyddmx_tmdj","jc_cgyddmx_mbmj","jc_cgyddmx_mbdj","jdm_mbbm_mbmc","jdm_mbfbbm_mbfbmc","jdm_xtbm_xtmc","jdm_lsbm_lsmc","jdm_ctbm_ctmc","jdm_jlbm_jlmc","jc_cgyddmx_bzzj","jc_cgyddmx_fbxs","jc_cgyddmx_sjzj","jc_cgyddmx_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_cgyddmxList.jsp?ddbh="+ddbh};//��ť�������õ���ҳ���������Ӳ���
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
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] xh = request.getParameterValues("xh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xh,"xh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jc_cgyddmx where "+chooseitem;
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
  <B><font size="3">����Ԥ������ϸ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="4%">���</td>
	<td  width="12%">����</td>
	<td  width="10%">̨��</td>
	<td  width="10%">�Ű�</td>
	<td  width="8%">�Ű���</td>
	<td  width="12%">����</td>
	<td  width="14%">����</td>
	<td  width="12%">����</td>
	<td  width="8%">����</td>
	<td  width="4%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
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