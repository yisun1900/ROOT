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
	String tc_mmjgb_dqbm=null;
	String tc_mmjgb_bjjbbm=null;
	String tc_mmjgb_tccplbbm=null;
	String tc_mmjgb_tccpdlbm=null;
	String tc_mmjgb_sfyqxtpp=null;
	String tc_mmjgb_jldw=null;
	String tc_mmjgb_bzsl=null;
	String tc_mmjgb_bzmj=null;
	String tc_mmjgb_mtmzjmj=null;
	String tc_mmjgb_ccbfjj=null;
	String tc_mmjgb_sfkjm=null;
	String tc_mmjgb_jmdj=null;
	String tc_mmjgb_sjzj=null;
	String tc_mmjgb_lrr=null;
	String tc_mmjgb_lrsj=null;
	tc_mmjgb_dqbm=request.getParameter("tc_mmjgb_dqbm");
	if (tc_mmjgb_dqbm!=null)
	{
		tc_mmjgb_dqbm=cf.GB2Uni(tc_mmjgb_dqbm);
		if (!(tc_mmjgb_dqbm.equals("")))	wheresql+=" and  (tc_mmjgb.dqbm='"+tc_mmjgb_dqbm+"')";
	}
	tc_mmjgb_bjjbbm=request.getParameter("tc_mmjgb_bjjbbm");
	if (tc_mmjgb_bjjbbm!=null)
	{
		tc_mmjgb_bjjbbm=cf.GB2Uni(tc_mmjgb_bjjbbm);
		if (!(tc_mmjgb_bjjbbm.equals("")))	wheresql+=" and  (tc_mmjgb.bjjbbm='"+tc_mmjgb_bjjbbm+"')";
	}
	tc_mmjgb_tccplbbm=request.getParameter("tc_mmjgb_tccplbbm");
	if (tc_mmjgb_tccplbbm!=null)
	{
		tc_mmjgb_tccplbbm=tc_mmjgb_tccplbbm.trim();
		if (!(tc_mmjgb_tccplbbm.equals("")))	wheresql+=" and (tc_mmjgb.tccplbbm="+tc_mmjgb_tccplbbm+") ";
	}
	tc_mmjgb_tccpdlbm=request.getParameter("tc_mmjgb_tccpdlbm");
	if (tc_mmjgb_tccpdlbm!=null)
	{
		tc_mmjgb_tccpdlbm=tc_mmjgb_tccpdlbm.trim();
		if (!(tc_mmjgb_tccpdlbm.equals("")))	wheresql+=" and (tc_mmjgb.tccpdlbm="+tc_mmjgb_tccpdlbm+") ";
	}
	tc_mmjgb_sfyqxtpp=request.getParameter("tc_mmjgb_sfyqxtpp");
	if (tc_mmjgb_sfyqxtpp!=null)
	{
		tc_mmjgb_sfyqxtpp=cf.GB2Uni(tc_mmjgb_sfyqxtpp);
		if (!(tc_mmjgb_sfyqxtpp.equals("")))	wheresql+=" and  (tc_mmjgb.sfyqxtpp='"+tc_mmjgb_sfyqxtpp+"')";
	}
	tc_mmjgb_jldw=request.getParameter("tc_mmjgb_jldw");
	if (tc_mmjgb_jldw!=null)
	{
		tc_mmjgb_jldw=cf.GB2Uni(tc_mmjgb_jldw);
		if (!(tc_mmjgb_jldw.equals("")))	wheresql+=" and  (tc_mmjgb.jldw='"+tc_mmjgb_jldw+"')";
	}
	tc_mmjgb_bzsl=request.getParameter("tc_mmjgb_bzsl");
	if (tc_mmjgb_bzsl!=null)
	{
		tc_mmjgb_bzsl=tc_mmjgb_bzsl.trim();
		if (!(tc_mmjgb_bzsl.equals("")))	wheresql+=" and  (tc_mmjgb.bzsl="+tc_mmjgb_bzsl+") ";
	}
	tc_mmjgb_bzmj=request.getParameter("tc_mmjgb_bzmj");
	if (tc_mmjgb_bzmj!=null)
	{
		tc_mmjgb_bzmj=tc_mmjgb_bzmj.trim();
		if (!(tc_mmjgb_bzmj.equals("")))	wheresql+=" and  (tc_mmjgb.bzmj="+tc_mmjgb_bzmj+") ";
	}
	tc_mmjgb_mtmzjmj=request.getParameter("tc_mmjgb_mtmzjmj");
	if (tc_mmjgb_mtmzjmj!=null)
	{
		tc_mmjgb_mtmzjmj=tc_mmjgb_mtmzjmj.trim();
		if (!(tc_mmjgb_mtmzjmj.equals("")))	wheresql+=" and  (tc_mmjgb.mtmzjmj="+tc_mmjgb_mtmzjmj+") ";
	}
	tc_mmjgb_ccbfjj=request.getParameter("tc_mmjgb_ccbfjj");
	if (tc_mmjgb_ccbfjj!=null)
	{
		tc_mmjgb_ccbfjj=tc_mmjgb_ccbfjj.trim();
		if (!(tc_mmjgb_ccbfjj.equals("")))	wheresql+=" and  (tc_mmjgb.ccbfjj="+tc_mmjgb_ccbfjj+") ";
	}
	tc_mmjgb_sfkjm=request.getParameter("tc_mmjgb_sfkjm");
	if (tc_mmjgb_sfkjm!=null)
	{
		tc_mmjgb_sfkjm=cf.GB2Uni(tc_mmjgb_sfkjm);
		if (!(tc_mmjgb_sfkjm.equals("")))	wheresql+=" and  (tc_mmjgb.sfkjm='"+tc_mmjgb_sfkjm+"')";
	}
	tc_mmjgb_jmdj=request.getParameter("tc_mmjgb_jmdj");
	if (tc_mmjgb_jmdj!=null)
	{
		tc_mmjgb_jmdj=tc_mmjgb_jmdj.trim();
		if (!(tc_mmjgb_jmdj.equals("")))	wheresql+=" and  (tc_mmjgb.jmdj="+tc_mmjgb_jmdj+") ";
	}
	tc_mmjgb_sjzj=request.getParameter("tc_mmjgb_sjzj");
	if (tc_mmjgb_sjzj!=null)
	{
		tc_mmjgb_sjzj=tc_mmjgb_sjzj.trim();
		if (!(tc_mmjgb_sjzj.equals("")))	wheresql+=" and  (tc_mmjgb.sjzj="+tc_mmjgb_sjzj+") ";
	}
	tc_mmjgb_lrr=request.getParameter("tc_mmjgb_lrr");
	if (tc_mmjgb_lrr!=null)
	{
		tc_mmjgb_lrr=cf.GB2Uni(tc_mmjgb_lrr);
		if (!(tc_mmjgb_lrr.equals("")))	wheresql+=" and  (tc_mmjgb.lrr='"+tc_mmjgb_lrr+"')";
	}
	tc_mmjgb_lrsj=request.getParameter("tc_mmjgb_lrsj");
	if (tc_mmjgb_lrsj!=null)
	{
		tc_mmjgb_lrsj=tc_mmjgb_lrsj.trim();
		if (!(tc_mmjgb_lrsj.equals("")))	wheresql+="  and (tc_mmjgb.lrsj=TO_DATE('"+tc_mmjgb_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_mmjgb.dqbm,dm_dqbm.dqmc,tc_mmjgb.bjjbbm,bdm_bjjbbm.bjjbmc,tc_mmjgb.tccplbbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc, DECODE(tc_mmjgb.sfyqxtpp,'Y','��','N','��'),tc_mmjgb.jldw,tc_mmjgb.bzsl,tc_mmjgb.bzmj,tc_mmjgb.mtmzjmj,tc_mmjgb.ccbfjj, DECODE(tc_mmjgb.sfkjm,'1','���ɼ���','2','�ɼ���'),tc_mmjgb.jmdj,tc_mmjgb.sjzj,tc_mmjgb.lrr,tc_mmjgb.lrsj  ";
	ls_sql+=" FROM bdm_bjjbbm,dm_dqbm,tc_mmjgb,jxc_cldlbm,jxc_clxlbm  ";
    ls_sql+=" where tc_mmjgb.bjjbbm=bdm_bjjbbm.bjjbbm(+) and tc_mmjgb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tc_mmjgb.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_mmjgb.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_mmjgb.dqbm,tc_mmjgb.bjjbbm,tc_mmjgb.tccpdlbm,tc_mmjgb.tccplbbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Tc_mmjgbCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dqbm","dm_dqbm_dqmc","bjjbbm","bdm_bjjbbm_bjjbmc","tccplbbm","tc_mmjgb_tccpdlbm","tc_mmjgb_sfyqxtpp","tc_mmjgb_jldw","tc_mmjgb_bzsl","tc_mmjgb_bzmj","tc_mmjgb_mtmzjmj","tc_mmjgb_ccbfjj","tc_mmjgb_sfkjm","tc_mmjgb_jmdj","tc_mmjgb_sjzj","tc_mmjgb_lrr","tc_mmjgb_lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"dqbm","bjjbbm","tccplbbm"};
	pageObj.setKey(keyName);
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
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">����</td>
	<td  width="5%">��������</td>
	<td  width="5%">���ۼ���</td>
	<td  width="7%">���ۼ�������</td>
	<td  width="5%">��ƷС�����</td>
	<td  width="6%">��ƷС��</td>
	<td  width="5%">��Ʒ����</td>
	<td  width="5%">�Ƿ�Ҫ����ͬƷ��</td>
	<td  width="4%">������λ</td>
	<td  width="4%">��׼����</td>
	<td  width="5%">��׼���</td>
	<td  width="5%">ÿ���������</td>
	<td  width="5%">�������ּӼ�</td>
	<td  width="5%">�Ƿ�ɼ���</td>
	<td  width="5%">���ⵥ��</td>
	<td  width="5%">�����ۼ�</td>
	<td  width="4%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
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