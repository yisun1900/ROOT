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
	String tc_jgb_dqbm=null;
	String tc_jgb_bjjbbm=null;
	String tc_jgb_tcmc=null;
	String tc_jgb_mjdj=null;
	String tc_jgb_zxmj=null;
	tc_jgb_dqbm=request.getParameter("tc_jgb_dqbm");
	if (tc_jgb_dqbm!=null)
	{
		tc_jgb_dqbm=cf.GB2Uni(tc_jgb_dqbm);
		if (!(tc_jgb_dqbm.equals("")))	wheresql+=" and  (tc_jgb.dqbm='"+tc_jgb_dqbm+"')";
	}
	tc_jgb_bjjbbm=request.getParameter("tc_jgb_bjjbbm");
	if (tc_jgb_bjjbbm!=null)
	{
		tc_jgb_bjjbbm=cf.GB2Uni(tc_jgb_bjjbbm);
		if (!(tc_jgb_bjjbbm.equals("")))	wheresql+=" and  (tc_jgb.bjjbbm='"+tc_jgb_bjjbbm+"')";
	}
	tc_jgb_tcmc=request.getParameter("tc_jgb_tcmc");
	if (tc_jgb_tcmc!=null)
	{
		tc_jgb_tcmc=cf.GB2Uni(tc_jgb_tcmc);
		if (!(tc_jgb_tcmc.equals("")))	wheresql+=" and  (tc_jgb.tcmc='"+tc_jgb_tcmc+"')";
	}
	tc_jgb_mjdj=request.getParameter("tc_jgb_mjdj");
	if (tc_jgb_mjdj!=null)
	{
		tc_jgb_mjdj=tc_jgb_mjdj.trim();
		if (!(tc_jgb_mjdj.equals("")))	wheresql+=" and  (tc_jgb.mjdj="+tc_jgb_mjdj+") ";
	}
	tc_jgb_zxmj=request.getParameter("tc_jgb_zxmj");
	if (tc_jgb_zxmj!=null)
	{
		tc_jgb_zxmj=tc_jgb_zxmj.trim();
		if (!(tc_jgb_zxmj.equals("")))	wheresql+=" and  (tc_jgb.zxmj="+tc_jgb_zxmj+") ";
	}
	ls_sql="SELECT tc_jgb.dqbm,dm_dqbm.dqmc,tc_jgb.bjjbbm,bjjbmc,tc_jgb.tcmc,tc_jgb.mjdj,tc_jgb.zxmj,tc_jgb.yssl,tc_jgb.tsf,tc_jgb.wyjg,tc_jgb.czjg  ";
	ls_sql+=" FROM dm_dqbm,tc_jgb,bdm_bjjbbm  ";
    ls_sql+=" where tc_jgb.dqbm=dm_dqbm.dqbm(+) and tc_jgb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_jgb.bjjbbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Tc_jgbList.jsp","","","EditTc_jgb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dqbm","dm_dqbm_dqmc","bjjbbm","tc_jgb_tcmc","tc_jgb_mjdj","tc_jgb_zxmj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"dqbm","bjjbbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Tc_jgbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
		sql[0]="delete from tc_jgb where "+chooseitem;
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="7%">����</td>
	<td  width="8%">����</td>
	<td  width="7%">���ۼ���</td>
	<td  width="10%">���ۼ���</td>
	<td  width="11%">�ײ�����</td>
	<td  width="11%">ƽ�׵���</td>
	<td  width="8%">��С���</td>
	<td  width="8%">�����޶���ɫ����</td>
	<td  width="7%">��ɫ��</td>
	<td  width="8%">ÿ����ԡ�۸�</td>
	<td  width="8%">ÿ�״�ש�۸�</td>
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