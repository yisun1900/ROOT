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

	ls_sql="SELECT TO_CHAR(jc_cgfcdmx.xh) xh,cgmc,dgjs||'*'||dggd,TO_CHAR(dgcd),TO_CHAR(dgdj),TO_CHAR(dgfbxs),tgjs||'*'||tggd,TO_CHAR(tdcd),TO_CHAR(tgdj),TO_CHAR(tgfbxs),jc_tmbj.tmmc,TO_CHAR(tmcd),TO_CHAR(tmdj),TO_CHAR(tmfbxs),jdm_mbbm.mbmc,TO_CHAR(mbmj),TO_CHAR(mbdj),jdm_mbfbbm.mbfbmc,jdm_xtbm.xtmc,jdm_lsbm.lsmc,jdm_ctbm.ctmc,jdm_jlbm.jlmc,jc_cgfcdmx.sjzj,jc_cgfcdmx.bz  ";
	ls_sql+=" FROM jc_cgfcdmx,jc_tmbj,jdm_ctbm,jdm_jlbm,jdm_lsbm,jdm_mbbm,jdm_mbfbbm,jdm_tjbbm,jdm_xtbm,jc_cgjgb  ";
    ls_sql+=" where jc_cgfcdmx.cgbm=jc_cgjgb.cgbm and jc_cgfcdmx.jlbm=jdm_jlbm.jlbm(+) and jc_cgfcdmx.ctbm=jdm_ctbm.ctbm(+)";
    ls_sql+=" and jc_cgfcdmx.tjbbm=jdm_tjbbm.tjbbm(+) and jc_cgfcdmx.lsbm=jdm_lsbm.lsbm(+) and jc_cgfcdmx.xtbm=jdm_xtbm.xtbm(+)";
    ls_sql+=" and jc_cgfcdmx.mbfbbm=jdm_mbfbbm.mbfbbm(+) and jc_cgfcdmx.mbbm=jdm_mbbm.mbbm(+) and jc_cgfcdmx.tmbm=jc_tmbj.tmbm(+)";
    ls_sql+=" and jc_cgfcdmx.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_cgfcdmx.xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_cgfcdmxList.jsp?ddbh="+ddbh,"","","EditJc_cgfcdmxMain.jsp");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","jc_cgfcdmx_cgbm","jc_cgfcdmx_dgcd","jc_cgfcdmx_dggd","jc_cgfcdmx_dgjs","jc_cgfcdmx_dgdj","jc_cgfcdmx_tdcd","jc_cgfcdmx_tggd","jc_cgfcdmx_tgjs","jc_tmbj_tmmc","jc_cgfcdmx_tmcd","jc_cgfcdmx_tmdj","jc_cgfcdmx_mbmj","jc_cgfcdmx_mbdj","jdm_mbbm_mbmc","jdm_mbfbbm_mbfbmc","jdm_xtbm_xtmc","jdm_lsbm_lsmc","jdm_ctbm_ctmc","jdm_jlbm_jlmc","jc_cgfcdmx_bzzj","jc_cgfcdmx_fbxs","jc_cgfcdmx_sjzj","jc_cgfcdmx_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_cgfcdmxList.jsp?ddbh="+ddbh};//��ť�������õ���ҳ���������Ӳ���
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
		sql[0]="delete from jc_cgfcdmx where "+chooseitem;
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
  <B><font size="3">���񸴲ⵥ��ϸ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="2%">���</td>
	<td  width="6%">����</td>
	<td  width="4%">����<BR>����*��</td>
	<td  width="3%">����</td>
	<td  width="3%">���񵥼�</td>
	<td  width="3%">����Ǳ�ϵ��</td>
	<td  width="4%">�ع�<BR>����*��</td>
	<td  width="3%">�ع񳤶�</td>
	<td  width="3%">�ع񵥼�</td>
	<td  width="3%">�ع�Ǳ�ϵ��</td>
	<td  width="3%">̨��</td>
	<td  width="3%">̨�泤��</td>
	<td  width="3%">̨�浥��</td>
	<td  width="3%">̨��Ǳ�ϵ��</td>
	<td  width="6%">�Ű�</td>
	<td  width="3%">�Ű����</td>
	<td  width="3%">�Ű嵥��</td>
	<td  width="5%">�Ű���</td>
	<td  width="6%">����</td>
	<td  width="8%">����</td>
	<td  width="7%">����</td>
	<td  width="4%">����</td>
	<td  width="4%">ʵ���ܼ�</td>
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