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
	String tc_czjgb_dqbm=null;
	String tc_czjgb_bjjbbm=null;
	String tc_czjgb_tccplbbm=null;
	String tc_czjgb_tccpdlbm=null;
	String tc_czjgb_sfyqxtpp=null;
	String tc_czjgb_jldw=null;
	String tc_czjgb_sfkjm=null;
	String tc_czjgb_jmdj=null;
	String tc_czjgb_sjzj=null;
	String tc_czjgb_lrr=null;
	String tc_czjgb_lrsj=null;
	tc_czjgb_dqbm=request.getParameter("tc_czjgb_dqbm");
	if (tc_czjgb_dqbm!=null)
	{
		tc_czjgb_dqbm=cf.GB2Uni(tc_czjgb_dqbm);
		if (!(tc_czjgb_dqbm.equals("")))	wheresql+=" and  (tc_czjgb.dqbm='"+tc_czjgb_dqbm+"')";
	}
	tc_czjgb_bjjbbm=request.getParameter("tc_czjgb_bjjbbm");
	if (tc_czjgb_bjjbbm!=null)
	{
		tc_czjgb_bjjbbm=cf.GB2Uni(tc_czjgb_bjjbbm);
		if (!(tc_czjgb_bjjbbm.equals("")))	wheresql+=" and  (tc_czjgb.bjjbbm='"+tc_czjgb_bjjbbm+"')";
	}
	tc_czjgb_tccplbbm=request.getParameter("tc_czjgb_tccplbbm");
	if (tc_czjgb_tccplbbm!=null)
	{
		tc_czjgb_tccplbbm=tc_czjgb_tccplbbm.trim();
		if (!(tc_czjgb_tccplbbm.equals("")))	wheresql+=" and (tc_czjgb.tccplbbm="+tc_czjgb_tccplbbm+") ";
	}
	tc_czjgb_tccpdlbm=request.getParameter("tc_czjgb_tccpdlbm");
	if (tc_czjgb_tccpdlbm!=null)
	{
		tc_czjgb_tccpdlbm=tc_czjgb_tccpdlbm.trim();
		if (!(tc_czjgb_tccpdlbm.equals("")))	wheresql+=" and (tc_czjgb.tccpdlbm="+tc_czjgb_tccpdlbm+") ";
	}
	tc_czjgb_sfyqxtpp=request.getParameter("tc_czjgb_sfyqxtpp");
	if (tc_czjgb_sfyqxtpp!=null)
	{
		tc_czjgb_sfyqxtpp=cf.GB2Uni(tc_czjgb_sfyqxtpp);
		if (!(tc_czjgb_sfyqxtpp.equals("")))	wheresql+=" and  (tc_czjgb.sfyqxtpp='"+tc_czjgb_sfyqxtpp+"')";
	}
	tc_czjgb_jldw=request.getParameter("tc_czjgb_jldw");
	if (tc_czjgb_jldw!=null)
	{
		tc_czjgb_jldw=cf.GB2Uni(tc_czjgb_jldw);
		if (!(tc_czjgb_jldw.equals("")))	wheresql+=" and  (tc_czjgb.jldw='"+tc_czjgb_jldw+"')";
	}
	tc_czjgb_sfkjm=request.getParameter("tc_czjgb_sfkjm");
	if (tc_czjgb_sfkjm!=null)
	{
		tc_czjgb_sfkjm=cf.GB2Uni(tc_czjgb_sfkjm);
		if (!(tc_czjgb_sfkjm.equals("")))	wheresql+=" and  (tc_czjgb.sfkjm='"+tc_czjgb_sfkjm+"')";
	}
	tc_czjgb_jmdj=request.getParameter("tc_czjgb_jmdj");
	if (tc_czjgb_jmdj!=null)
	{
		tc_czjgb_jmdj=tc_czjgb_jmdj.trim();
		if (!(tc_czjgb_jmdj.equals("")))	wheresql+=" and  (tc_czjgb.jmdj="+tc_czjgb_jmdj+") ";
	}
	tc_czjgb_sjzj=request.getParameter("tc_czjgb_sjzj");
	if (tc_czjgb_sjzj!=null)
	{
		tc_czjgb_sjzj=tc_czjgb_sjzj.trim();
		if (!(tc_czjgb_sjzj.equals("")))	wheresql+=" and  (tc_czjgb.sjzj="+tc_czjgb_sjzj+") ";
	}
	tc_czjgb_lrr=request.getParameter("tc_czjgb_lrr");
	if (tc_czjgb_lrr!=null)
	{
		tc_czjgb_lrr=cf.GB2Uni(tc_czjgb_lrr);
		if (!(tc_czjgb_lrr.equals("")))	wheresql+=" and  (tc_czjgb.lrr='"+tc_czjgb_lrr+"')";
	}
	tc_czjgb_lrsj=request.getParameter("tc_czjgb_lrsj");
	if (tc_czjgb_lrsj!=null)
	{
		tc_czjgb_lrsj=tc_czjgb_lrsj.trim();
		if (!(tc_czjgb_lrsj.equals("")))	wheresql+="  and (tc_czjgb.lrsj=TO_DATE('"+tc_czjgb_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_czjgb.dqbm,dm_dqbm.dqmc,tc_czjgb.bjjbbm,bdm_bjjbbm.bjjbmc,tc_czjgb.tccplbbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc, DECODE(tc_czjgb.sfyqxtpp,'Y','��','N','��'),tc_czjgb.jldw, DECODE(tc_czjgb.sfkjm,'1','���ɼ���','2','�ɼ���'),tc_czjgb.jmdj,tc_czjgb.sjzj,DECODE(tc_czjgb.lx,'1','�ײ���','2','�ײ���'),tc_czjgb.lrr,tc_czjgb.lrsj  ";
	ls_sql+=" FROM bdm_bjjbbm,dm_dqbm,tc_czjgb,jxc_cldlbm,jxc_clxlbm  ";
    ls_sql+=" where tc_czjgb.bjjbbm=bdm_bjjbbm.bjjbbm(+) and tc_czjgb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tc_czjgb.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_czjgb.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_czjgb.dqbm,tc_czjgb.bjjbbm,tc_czjgb.tccpdlbm,tc_czjgb.tccplbbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Tc_czjgbList.jsp","","","EditTc_czjgb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dqbm","dm_dqbm_dqmc","bjjbbm","bdm_bjjbbm_bjjbmc","tccplbbm","tc_czjgb_tccpdlbm","tc_czjgb_sfyqxtpp","tc_czjgb_jldw","tc_czjgb_sfkjm","tc_czjgb_jmdj","tc_czjgb_sjzj","tc_czjgb_lrr","tc_czjgb_lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"dqbm","bjjbbm","tccplbbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Tc_czjgbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
		sql[0]="delete from tc_czjgb where "+chooseitem;
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
	<td  width="5%">����</td>
	<td  width="6%">����</td>
	<td  width="5%">���ۼ���</td>
	<td  width="8%">���ۼ���</td>
	<td  width="5%">��ƷС��</td>
	<td  width="9%">��ƷС��</td>
	<td  width="9%">��Ʒ����</td>
	<td  width="6%">�Ƿ�Ҫ����ͬƷ��</td>
	<td  width="6%">������λ</td>
	<td  width="6%">�Ƿ�ɼ���</td>
	<td  width="6%">���ⵥ��</td>
	<td  width="6%">�����ۼ�</td>
	<td  width="5%">����</td>
	<td  width="5%">¼����</td>
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