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
	String tc_lkbjgb_dqbm=null;
	String tc_lkbjgb_bjjbbm=null;
	String tc_lkbjgb_tccplbbm=null;
	String tc_lkbjgb_tccpdlbm=null;
	String tc_lkbjgb_sfyqxtpp=null;
	String tc_lkbjgb_jldw=null;
	String tc_lkbjgb_sfkjm=null;
	String tc_lkbjgb_jmdj=null;
	String tc_lkbjgb_sjzj=null;
	String tc_lkbjgb_lrr=null;
	String tc_lkbjgb_lrsj=null;
	tc_lkbjgb_dqbm=request.getParameter("tc_lkbjgb_dqbm");
	if (tc_lkbjgb_dqbm!=null)
	{
		tc_lkbjgb_dqbm=cf.GB2Uni(tc_lkbjgb_dqbm);
		if (!(tc_lkbjgb_dqbm.equals("")))	wheresql+=" and  (tc_lkbjgb.dqbm='"+tc_lkbjgb_dqbm+"')";
	}
	tc_lkbjgb_bjjbbm=request.getParameter("tc_lkbjgb_bjjbbm");
	if (tc_lkbjgb_bjjbbm!=null)
	{
		tc_lkbjgb_bjjbbm=cf.GB2Uni(tc_lkbjgb_bjjbbm);
		if (!(tc_lkbjgb_bjjbbm.equals("")))	wheresql+=" and  (tc_lkbjgb.bjjbbm='"+tc_lkbjgb_bjjbbm+"')";
	}
	tc_lkbjgb_tccplbbm=request.getParameter("tc_lkbjgb_tccplbbm");
	if (tc_lkbjgb_tccplbbm!=null)
	{
		tc_lkbjgb_tccplbbm=tc_lkbjgb_tccplbbm.trim();
		if (!(tc_lkbjgb_tccplbbm.equals("")))	wheresql+=" and (tc_lkbjgb.tccplbbm="+tc_lkbjgb_tccplbbm+") ";
	}
	tc_lkbjgb_tccpdlbm=request.getParameter("tc_lkbjgb_tccpdlbm");
	if (tc_lkbjgb_tccpdlbm!=null)
	{
		tc_lkbjgb_tccpdlbm=tc_lkbjgb_tccpdlbm.trim();
		if (!(tc_lkbjgb_tccpdlbm.equals("")))	wheresql+=" and (tc_lkbjgb.tccpdlbm="+tc_lkbjgb_tccpdlbm+") ";
	}
	tc_lkbjgb_sfyqxtpp=request.getParameter("tc_lkbjgb_sfyqxtpp");
	if (tc_lkbjgb_sfyqxtpp!=null)
	{
		tc_lkbjgb_sfyqxtpp=cf.GB2Uni(tc_lkbjgb_sfyqxtpp);
		if (!(tc_lkbjgb_sfyqxtpp.equals("")))	wheresql+=" and  (tc_lkbjgb.sfyqxtpp='"+tc_lkbjgb_sfyqxtpp+"')";
	}
	tc_lkbjgb_jldw=request.getParameter("tc_lkbjgb_jldw");
	if (tc_lkbjgb_jldw!=null)
	{
		tc_lkbjgb_jldw=cf.GB2Uni(tc_lkbjgb_jldw);
		if (!(tc_lkbjgb_jldw.equals("")))	wheresql+=" and  (tc_lkbjgb.jldw='"+tc_lkbjgb_jldw+"')";
	}
	tc_lkbjgb_sfkjm=request.getParameter("tc_lkbjgb_sfkjm");
	if (tc_lkbjgb_sfkjm!=null)
	{
		tc_lkbjgb_sfkjm=cf.GB2Uni(tc_lkbjgb_sfkjm);
		if (!(tc_lkbjgb_sfkjm.equals("")))	wheresql+=" and  (tc_lkbjgb.sfkjm='"+tc_lkbjgb_sfkjm+"')";
	}
	tc_lkbjgb_jmdj=request.getParameter("tc_lkbjgb_jmdj");
	if (tc_lkbjgb_jmdj!=null)
	{
		tc_lkbjgb_jmdj=tc_lkbjgb_jmdj.trim();
		if (!(tc_lkbjgb_jmdj.equals("")))	wheresql+=" and  (tc_lkbjgb.jmdj="+tc_lkbjgb_jmdj+") ";
	}
	tc_lkbjgb_sjzj=request.getParameter("tc_lkbjgb_sjzj");
	if (tc_lkbjgb_sjzj!=null)
	{
		tc_lkbjgb_sjzj=tc_lkbjgb_sjzj.trim();
		if (!(tc_lkbjgb_sjzj.equals("")))	wheresql+=" and  (tc_lkbjgb.sjzj="+tc_lkbjgb_sjzj+") ";
	}
	tc_lkbjgb_lrr=request.getParameter("tc_lkbjgb_lrr");
	if (tc_lkbjgb_lrr!=null)
	{
		tc_lkbjgb_lrr=cf.GB2Uni(tc_lkbjgb_lrr);
		if (!(tc_lkbjgb_lrr.equals("")))	wheresql+=" and  (tc_lkbjgb.lrr='"+tc_lkbjgb_lrr+"')";
	}
	tc_lkbjgb_lrsj=request.getParameter("tc_lkbjgb_lrsj");
	if (tc_lkbjgb_lrsj!=null)
	{
		tc_lkbjgb_lrsj=tc_lkbjgb_lrsj.trim();
		if (!(tc_lkbjgb_lrsj.equals("")))	wheresql+="  and (tc_lkbjgb.lrsj=TO_DATE('"+tc_lkbjgb_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_lkbjgb.dqbm,dm_dqbm.dqmc,tc_lkbjgb.bjjbbm,bdm_bjjbbm.bjjbmc,tc_lkbjgb.tccplbbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc, DECODE(tc_lkbjgb.sfyqxtpp,'Y','��','N','��'),tc_lkbjgb.jldw, DECODE(tc_lkbjgb.sfkjm,'1','���ɼ���','2','�ɼ���'),tc_lkbjgb.jmdj,tc_lkbjgb.sjzj,tc_lkbjgb.lrr,tc_lkbjgb.lrsj  ";
	ls_sql+=" FROM bdm_bjjbbm,dm_dqbm,tc_lkbjgb,jxc_cldlbm,jxc_clxlbm  ";
    ls_sql+=" where tc_lkbjgb.bjjbbm=bdm_bjjbbm.bjjbbm(+) and tc_lkbjgb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tc_lkbjgb.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_lkbjgb.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_lkbjgb.dqbm,tc_lkbjgb.bjjbbm,tc_lkbjgb.tccpdlbm,tc_lkbjgb.tccplbbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Tc_lkbjgbList.jsp","","","EditTc_lkbjgb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dqbm","dm_dqbm_dqmc","bjjbbm","bdm_bjjbbm_bjjbmc","tccplbbm","tc_lkbjgb_tccpdlbm","tc_lkbjgb_sfyqxtpp","tc_lkbjgb_jldw","tc_lkbjgb_sfkjm","tc_lkbjgb_jmdj","tc_lkbjgb_sjzj","tc_lkbjgb_lrr","tc_lkbjgb_lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"dqbm","bjjbbm","tccplbbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Tc_lkbjgbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
		sql[0]="delete from tc_lkbjgb where "+chooseitem;
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