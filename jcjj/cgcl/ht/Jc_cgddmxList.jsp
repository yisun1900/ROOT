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

	ls_sql="SELECT TO_CHAR(jc_cgddmx.xh) xh,cgmc,dgjs||'*'||dggd,TO_CHAR(dgcd),TO_CHAR(dgdj),TO_CHAR(dgfbxs),tgjs||'*'||tggd,TO_CHAR(tdcd),TO_CHAR(tgdj),TO_CHAR(tgfbxs),jc_tmbj.tmmc,TO_CHAR(tmcd),TO_CHAR(tmdj),TO_CHAR(tmfbxs),jdm_mbbm.mbmc,TO_CHAR(mbmj),TO_CHAR(mbdj),jdm_mbfbbm.mbfbmc,jdm_xtbm.xtmc,jdm_lsbm.lsmc,jdm_ctbm.ctmc,jdm_jlbm.jlmc,jc_cgddmx.sjzj,jc_cgddmx.bz  ";
	ls_sql+=" FROM jc_cgddmx,jc_tmbj,jdm_ctbm,jdm_jlbm,jdm_lsbm,jdm_mbbm,jdm_mbfbbm,jdm_tjbbm,jdm_xtbm,jc_cgjgb  ";
    ls_sql+=" where jc_cgddmx.cgbm=jc_cgjgb.cgbm and jc_cgddmx.jlbm=jdm_jlbm.jlbm(+) and jc_cgddmx.ctbm=jdm_ctbm.ctbm(+)";
    ls_sql+=" and jc_cgddmx.tjbbm=jdm_tjbbm.tjbbm(+) and jc_cgddmx.lsbm=jdm_lsbm.lsbm(+) and jc_cgddmx.xtbm=jdm_xtbm.xtbm(+)";
    ls_sql+=" and jc_cgddmx.mbfbbm=jdm_mbfbbm.mbfbbm(+) and jc_cgddmx.mbbm=jdm_mbbm.mbbm(+) and jc_cgddmx.tmbm=jc_tmbj.tmbm(+)";
    ls_sql+=" and jc_cgddmx.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_cgddmx.xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_cgddmxList.jsp?ddbh="+ddbh,"","","EditJc_cgddmxMain.jsp");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","jc_cgddmx_cgbm","jc_cgddmx_dgcd","jc_cgddmx_dggd","jc_cgddmx_dgjs","jc_cgddmx_dgdj","jc_cgddmx_tdcd","jc_cgddmx_tggd","jc_cgddmx_tgjs","jc_tmbj_tmmc","jc_cgddmx_tmcd","jc_cgddmx_tmdj","jc_cgddmx_mbmj","jc_cgddmx_mbdj","jdm_mbbm_mbmc","jdm_mbfbbm_mbfbmc","jdm_xtbm_xtmc","jdm_lsbm_lsmc","jdm_ctbm_ctmc","jdm_jlbm_jlmc","jc_cgddmx_bzzj","jc_cgddmx_fbxs","jc_cgddmx_sjzj","jc_cgddmx_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_cgddmxList.jsp?ddbh="+ddbh};//��ť�������õ���ҳ���������Ӳ���
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
		sql[0]="delete from jc_cgddmx where "+chooseitem;

/*
		sql[1]="update jc_cgdd set cghtze=NVL((select sum(sjzj) from  jc_cgddmx where ddbh='"+ddbh+"'),0)";
		sql[1]+=" where ddbh='"+ddbh+"'";

		sql[2]="update jc_cgdd set htze=cghtze+wjhtze+dqhtze,ssje=cghtze+wjhtze+dqhtze-zsje";
		sql[2]+=" where ddbh='"+ddbh+"'";
*/
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
  <B><font size="3">���񶩵���ϸ</font></B>
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