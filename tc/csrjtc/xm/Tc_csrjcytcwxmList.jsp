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
	String tc_csrjcytcwxm_dqbm=null;
	String tc_csrjcytcwxm_bjjbbm=null;
	String tc_csrjcytcwxm_tccplbbm=null;
	String tc_csrjcytcwxm_tccpdlbm=null;
	tc_csrjcytcwxm_dqbm=request.getParameter("tc_csrjcytcwxm_dqbm");
	if (tc_csrjcytcwxm_dqbm!=null)
	{
		tc_csrjcytcwxm_dqbm=cf.GB2Uni(tc_csrjcytcwxm_dqbm);
		if (!(tc_csrjcytcwxm_dqbm.equals("")))	wheresql+=" and  (tc_csrjcytcwxm.dqbm='"+tc_csrjcytcwxm_dqbm+"')";
	}
	tc_csrjcytcwxm_bjjbbm=request.getParameter("tc_csrjcytcwxm_bjjbbm");
	if (tc_csrjcytcwxm_bjjbbm!=null)
	{
		tc_csrjcytcwxm_bjjbbm=cf.GB2Uni(tc_csrjcytcwxm_bjjbbm);
		if (!(tc_csrjcytcwxm_bjjbbm.equals("")))	wheresql+=" and  (tc_csrjcytcwxm.bjjbbm='"+tc_csrjcytcwxm_bjjbbm+"')";
	}
	tc_csrjcytcwxm_tccplbbm=request.getParameter("tc_csrjcytcwxm_tccplbbm");
	if (tc_csrjcytcwxm_tccplbbm!=null)
	{
		tc_csrjcytcwxm_tccplbbm=tc_csrjcytcwxm_tccplbbm.trim();
		if (!(tc_csrjcytcwxm_tccplbbm.equals("")))	wheresql+=" and (tc_csrjcytcwxm.tccplbbm="+tc_csrjcytcwxm_tccplbbm+") ";
	}
	tc_csrjcytcwxm_tccpdlbm=request.getParameter("tc_csrjcytcwxm_tccpdlbm");
	if (tc_csrjcytcwxm_tccpdlbm!=null)
	{
		tc_csrjcytcwxm_tccpdlbm=tc_csrjcytcwxm_tccpdlbm.trim();
		if (!(tc_csrjcytcwxm_tccpdlbm.equals("")))	wheresql+=" and (tc_csrjcytcwxm.tccpdlbm="+tc_csrjcytcwxm_tccpdlbm+") ";
	}
	ls_sql="SELECT tc_csrjcytcwxm.dqbm,dqmc,tc_csrjcytcwxm.bjjbbm,bdm_bjjbbm.bjjbmc,tc_csrjcytcwxm.tccplbbm,clxlmc,jxc_cldlbm.cldlmc";
	ls_sql+=" FROM bdm_bjjbbm,tc_csrjcytcwxm,dm_dqbm,jxc_clxlbm,jxc_cldlbm  ";
    ls_sql+=" where tc_csrjcytcwxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tc_csrjcytcwxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tc_csrjcytcwxm.tccpdlbm=jxc_cldlbm.cldlbm(+)";
    ls_sql+=" and tc_csrjcytcwxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_csrjcytcwxm.dqbm,tc_csrjcytcwxm.bjjbbm,tc_csrjcytcwxm.tccpdlbm,tc_csrjcytcwxm.tccplbbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Tc_csrjcytcwxmList.jsp","","","EditTc_csrjcytcwxm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dqbm","bjjbbm","bdm_bjjbbm_bjjbmc","tccplbbm","tc_csrjcytcwxm_tccpdlbm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"dqbm","bjjbbm","tccplbbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Tc_csrjcytcwxmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
		sql[0]="delete from tc_csrjcytcwxm where "+chooseitem;
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
	<td  width="8%">����</td>
	<td  width="17%">����</td>
	<td  width="8%">���ۼ���</td>
	<td  width="17%">���ۼ���</td>
	<td  width="8%">��Ʒ���</td>
	<td  width="17%">��Ʒ���</td>
	<td  width="17%">��Ʒ����</td>
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