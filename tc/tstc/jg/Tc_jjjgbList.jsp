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
	String tc_jjjgb_dqbm=null;
	String tc_jjjgb_bjjbbm=null;
	String tc_jjjgb_tccplbbm=null;
	String tc_jjjgb_tccpdlbm=null;
	String tc_jjjgb_sfyqxtpp=null;
	String tc_jjjgb_jldw=null;
	String tc_jjjgb_sfkjm=null;
	String tc_jjjgb_jmdj=null;
	String tc_jjjgb_sjzj=null;
	String tc_jjjgb_lrr=null;
	String tc_jjjgb_lrsj=null;
	tc_jjjgb_dqbm=request.getParameter("tc_jjjgb_dqbm");
	if (tc_jjjgb_dqbm!=null)
	{
		tc_jjjgb_dqbm=cf.GB2Uni(tc_jjjgb_dqbm);
		if (!(tc_jjjgb_dqbm.equals("")))	wheresql+=" and  (tc_jjjgb.dqbm='"+tc_jjjgb_dqbm+"')";
	}
	tc_jjjgb_bjjbbm=request.getParameter("tc_jjjgb_bjjbbm");
	if (tc_jjjgb_bjjbbm!=null)
	{
		tc_jjjgb_bjjbbm=cf.GB2Uni(tc_jjjgb_bjjbbm);
		if (!(tc_jjjgb_bjjbbm.equals("")))	wheresql+=" and  (tc_jjjgb.bjjbbm='"+tc_jjjgb_bjjbbm+"')";
	}
	tc_jjjgb_tccplbbm=request.getParameter("tc_jjjgb_tccplbbm");
	if (tc_jjjgb_tccplbbm!=null)
	{
		tc_jjjgb_tccplbbm=tc_jjjgb_tccplbbm.trim();
		if (!(tc_jjjgb_tccplbbm.equals("")))	wheresql+=" and (tc_jjjgb.tccplbbm="+tc_jjjgb_tccplbbm+") ";
	}
	tc_jjjgb_tccpdlbm=request.getParameter("tc_jjjgb_tccpdlbm");
	if (tc_jjjgb_tccpdlbm!=null)
	{
		tc_jjjgb_tccpdlbm=tc_jjjgb_tccpdlbm.trim();
		if (!(tc_jjjgb_tccpdlbm.equals("")))	wheresql+=" and (tc_jjjgb.tccpdlbm="+tc_jjjgb_tccpdlbm+") ";
	}
	tc_jjjgb_sfyqxtpp=request.getParameter("tc_jjjgb_sfyqxtpp");
	if (tc_jjjgb_sfyqxtpp!=null)
	{
		tc_jjjgb_sfyqxtpp=cf.GB2Uni(tc_jjjgb_sfyqxtpp);
		if (!(tc_jjjgb_sfyqxtpp.equals("")))	wheresql+=" and  (tc_jjjgb.sfyqxtpp='"+tc_jjjgb_sfyqxtpp+"')";
	}
	tc_jjjgb_jldw=request.getParameter("tc_jjjgb_jldw");
	if (tc_jjjgb_jldw!=null)
	{
		tc_jjjgb_jldw=cf.GB2Uni(tc_jjjgb_jldw);
		if (!(tc_jjjgb_jldw.equals("")))	wheresql+=" and  (tc_jjjgb.jldw='"+tc_jjjgb_jldw+"')";
	}
	tc_jjjgb_sfkjm=request.getParameter("tc_jjjgb_sfkjm");
	if (tc_jjjgb_sfkjm!=null)
	{
		tc_jjjgb_sfkjm=cf.GB2Uni(tc_jjjgb_sfkjm);
		if (!(tc_jjjgb_sfkjm.equals("")))	wheresql+=" and  (tc_jjjgb.sfkjm='"+tc_jjjgb_sfkjm+"')";
	}
	tc_jjjgb_jmdj=request.getParameter("tc_jjjgb_jmdj");
	if (tc_jjjgb_jmdj!=null)
	{
		tc_jjjgb_jmdj=tc_jjjgb_jmdj.trim();
		if (!(tc_jjjgb_jmdj.equals("")))	wheresql+=" and  (tc_jjjgb.jmdj="+tc_jjjgb_jmdj+") ";
	}
	tc_jjjgb_sjzj=request.getParameter("tc_jjjgb_sjzj");
	if (tc_jjjgb_sjzj!=null)
	{
		tc_jjjgb_sjzj=tc_jjjgb_sjzj.trim();
		if (!(tc_jjjgb_sjzj.equals("")))	wheresql+=" and  (tc_jjjgb.sjzj="+tc_jjjgb_sjzj+") ";
	}
	tc_jjjgb_lrr=request.getParameter("tc_jjjgb_lrr");
	if (tc_jjjgb_lrr!=null)
	{
		tc_jjjgb_lrr=cf.GB2Uni(tc_jjjgb_lrr);
		if (!(tc_jjjgb_lrr.equals("")))	wheresql+=" and  (tc_jjjgb.lrr='"+tc_jjjgb_lrr+"')";
	}
	tc_jjjgb_lrsj=request.getParameter("tc_jjjgb_lrsj");
	if (tc_jjjgb_lrsj!=null)
	{
		tc_jjjgb_lrsj=tc_jjjgb_lrsj.trim();
		if (!(tc_jjjgb_lrsj.equals("")))	wheresql+="  and (tc_jjjgb.lrsj=TO_DATE('"+tc_jjjgb_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_jjjgb.dqbm,dm_dqbm.dqmc,tc_jjjgb.bjjbbm,bdm_bjjbbm.bjjbmc,tc_jjjgb.tccplbbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc, DECODE(tc_jjjgb.sfyqxtpp,'Y','��','N','��'),tc_jjjgb.jldw, DECODE(tc_jjjgb.sfkjm,'1','���ɼ���','2','�ɼ���'),tc_jjjgb.jmdj,tc_jjjgb.sjzj,tc_jjjgb.lrr,tc_jjjgb.lrsj  ";
	ls_sql+=" FROM bdm_bjjbbm,dm_dqbm,tc_jjjgb,jxc_cldlbm,jxc_clxlbm  ";
    ls_sql+=" where tc_jjjgb.bjjbbm=bdm_bjjbbm.bjjbbm(+) and tc_jjjgb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tc_jjjgb.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_jjjgb.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_jjjgb.dqbm,tc_jjjgb.bjjbbm,tc_jjjgb.tccpdlbm,tc_jjjgb.tccplbbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Tc_jjjgbList.jsp","","","EditTc_jjjgb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dqbm","dm_dqbm_dqmc","bjjbbm","bdm_bjjbbm_bjjbmc","tccplbbm","tc_jjjgb_tccpdlbm","tc_jjjgb_sfyqxtpp","tc_jjjgb_jldw","tc_jjjgb_sfkjm","tc_jjjgb_jmdj","tc_jjjgb_sjzj","tc_jjjgb_lrr","tc_jjjgb_lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"dqbm","bjjbbm","tccplbbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Tc_jjjgbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
		sql[0]="delete from tc_jjjgb where "+chooseitem;
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
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="6%">����</td>
	<td  width="6%">����</td>
	<td  width="6%">���ۼ���</td>
	<td  width="8%">���ۼ���</td>
	<td  width="6%">��ƷС��</td>
	<td  width="9%">��ƷС��</td>
	<td  width="9%">��Ʒ����</td>
	<td  width="6%">�Ƿ�Ҫ����ͬƷ��</td>
	<td  width="6%">������λ</td>
	<td  width="6%">�Ƿ�ɼ���</td>
	<td  width="6%">���ⵥ��</td>
	<td  width="6%">�����ۼ�</td>
	<td  width="6%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
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