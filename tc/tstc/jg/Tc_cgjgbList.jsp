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
	String tc_cgjgb_dqbm=null;
	String tc_cgjgb_bjjbbm=null;
	String tc_cgjgb_tccplbbm=null;
	String tc_cgjgb_tccpdlbm=null;
	String tc_cgjgb_sfyqxtpp=null;
	String tc_cgjgb_jldw=null;
	String tc_cgjgb_bzsl=null;
	String tc_cgjgb_bzmj=null;
	String tc_cgjgb_ccbfjj=null;
	String tc_cgjgb_sfkjm=null;
	String tc_cgjgb_jmdj=null;
	String tc_cgjgb_sjzj=null;
	String tc_cgjgb_lrr=null;
	String tc_cgjgb_lrsj=null;
	tc_cgjgb_dqbm=request.getParameter("tc_cgjgb_dqbm");
	if (tc_cgjgb_dqbm!=null)
	{
		tc_cgjgb_dqbm=cf.GB2Uni(tc_cgjgb_dqbm);
		if (!(tc_cgjgb_dqbm.equals("")))	wheresql+=" and  (tc_cgjgb.dqbm='"+tc_cgjgb_dqbm+"')";
	}
	tc_cgjgb_bjjbbm=request.getParameter("tc_cgjgb_bjjbbm");
	if (tc_cgjgb_bjjbbm!=null)
	{
		tc_cgjgb_bjjbbm=cf.GB2Uni(tc_cgjgb_bjjbbm);
		if (!(tc_cgjgb_bjjbbm.equals("")))	wheresql+=" and  (tc_cgjgb.bjjbbm='"+tc_cgjgb_bjjbbm+"')";
	}
	tc_cgjgb_tccplbbm=request.getParameter("tc_cgjgb_tccplbbm");
	if (tc_cgjgb_tccplbbm!=null)
	{
		tc_cgjgb_tccplbbm=tc_cgjgb_tccplbbm.trim();
		if (!(tc_cgjgb_tccplbbm.equals("")))	wheresql+=" and (tc_cgjgb.tccplbbm="+tc_cgjgb_tccplbbm+") ";
	}
	tc_cgjgb_tccpdlbm=request.getParameter("tc_cgjgb_tccpdlbm");
	if (tc_cgjgb_tccpdlbm!=null)
	{
		tc_cgjgb_tccpdlbm=tc_cgjgb_tccpdlbm.trim();
		if (!(tc_cgjgb_tccpdlbm.equals("")))	wheresql+=" and (tc_cgjgb.tccpdlbm="+tc_cgjgb_tccpdlbm+") ";
	}
	tc_cgjgb_sfyqxtpp=request.getParameter("tc_cgjgb_sfyqxtpp");
	if (tc_cgjgb_sfyqxtpp!=null)
	{
		tc_cgjgb_sfyqxtpp=cf.GB2Uni(tc_cgjgb_sfyqxtpp);
		if (!(tc_cgjgb_sfyqxtpp.equals("")))	wheresql+=" and  (tc_cgjgb.sfyqxtpp='"+tc_cgjgb_sfyqxtpp+"')";
	}
	tc_cgjgb_jldw=request.getParameter("tc_cgjgb_jldw");
	if (tc_cgjgb_jldw!=null)
	{
		tc_cgjgb_jldw=cf.GB2Uni(tc_cgjgb_jldw);
		if (!(tc_cgjgb_jldw.equals("")))	wheresql+=" and  (tc_cgjgb.jldw='"+tc_cgjgb_jldw+"')";
	}
	tc_cgjgb_bzsl=request.getParameter("tc_cgjgb_bzsl");
	if (tc_cgjgb_bzsl!=null)
	{
		tc_cgjgb_bzsl=tc_cgjgb_bzsl.trim();
		if (!(tc_cgjgb_bzsl.equals("")))	wheresql+=" and  (tc_cgjgb.bzsl="+tc_cgjgb_bzsl+") ";
	}
	tc_cgjgb_bzmj=request.getParameter("tc_cgjgb_bzmj");
	if (tc_cgjgb_bzmj!=null)
	{
		tc_cgjgb_bzmj=tc_cgjgb_bzmj.trim();
		if (!(tc_cgjgb_bzmj.equals("")))	wheresql+=" and  (tc_cgjgb.bzmj="+tc_cgjgb_bzmj+") ";
	}
	tc_cgjgb_ccbfjj=request.getParameter("tc_cgjgb_ccbfjj");
	if (tc_cgjgb_ccbfjj!=null)
	{
		tc_cgjgb_ccbfjj=tc_cgjgb_ccbfjj.trim();
		if (!(tc_cgjgb_ccbfjj.equals("")))	wheresql+=" and  (tc_cgjgb.ccbfjj="+tc_cgjgb_ccbfjj+") ";
	}
	tc_cgjgb_sfkjm=request.getParameter("tc_cgjgb_sfkjm");
	if (tc_cgjgb_sfkjm!=null)
	{
		tc_cgjgb_sfkjm=cf.GB2Uni(tc_cgjgb_sfkjm);
		if (!(tc_cgjgb_sfkjm.equals("")))	wheresql+=" and  (tc_cgjgb.sfkjm='"+tc_cgjgb_sfkjm+"')";
	}
	tc_cgjgb_jmdj=request.getParameter("tc_cgjgb_jmdj");
	if (tc_cgjgb_jmdj!=null)
	{
		tc_cgjgb_jmdj=tc_cgjgb_jmdj.trim();
		if (!(tc_cgjgb_jmdj.equals("")))	wheresql+=" and  (tc_cgjgb.jmdj="+tc_cgjgb_jmdj+") ";
	}
	tc_cgjgb_sjzj=request.getParameter("tc_cgjgb_sjzj");
	if (tc_cgjgb_sjzj!=null)
	{
		tc_cgjgb_sjzj=tc_cgjgb_sjzj.trim();
		if (!(tc_cgjgb_sjzj.equals("")))	wheresql+=" and  (tc_cgjgb.sjzj="+tc_cgjgb_sjzj+") ";
	}
	tc_cgjgb_lrr=request.getParameter("tc_cgjgb_lrr");
	if (tc_cgjgb_lrr!=null)
	{
		tc_cgjgb_lrr=cf.GB2Uni(tc_cgjgb_lrr);
		if (!(tc_cgjgb_lrr.equals("")))	wheresql+=" and  (tc_cgjgb.lrr='"+tc_cgjgb_lrr+"')";
	}
	tc_cgjgb_lrsj=request.getParameter("tc_cgjgb_lrsj");
	if (tc_cgjgb_lrsj!=null)
	{
		tc_cgjgb_lrsj=tc_cgjgb_lrsj.trim();
		if (!(tc_cgjgb_lrsj.equals("")))	wheresql+="  and (tc_cgjgb.lrsj=TO_DATE('"+tc_cgjgb_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_cgjgb.dqbm,dm_dqbm.dqmc,tc_cgjgb.bjjbbm,bdm_bjjbbm.bjjbmc,tc_cgjgb.tccplbbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc, DECODE(tc_cgjgb.sfyqxtpp,'Y','��','N','��'),tc_cgjgb.jldw,tc_cgjgb.bzsl,tc_cgjgb.bzmj,tc_cgjgb.ccbfjj, DECODE(tc_cgjgb.sfkjm,'1','���ɼ���','2','�ɼ���'),tc_cgjgb.jmdj,tc_cgjgb.sjzj,tc_cgjgb.lrr,tc_cgjgb.lrsj  ";
	ls_sql+=" FROM bdm_bjjbbm,dm_dqbm,tc_cgjgb,jxc_cldlbm,jxc_clxlbm  ";
    ls_sql+=" where tc_cgjgb.dqbm=dm_dqbm.dqbm(+) and tc_cgjgb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tc_cgjgb.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_cgjgb.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_cgjgb.dqbm,tc_cgjgb.bjjbbm,tc_cgjgb.tccpdlbm,tc_cgjgb.tccplbbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Tc_cgjgbList.jsp","","","EditTc_cgjgb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dqbm","dm_dqbm_dqmc","bjjbbm","bdm_bjjbbm_bjjbmc","tccplbbm","tc_cgjgb_tccpdlbm","tc_cgjgb_sfyqxtpp","tc_cgjgb_jldw","tc_cgjgb_bzsl","tc_cgjgb_bzmj","tc_cgjgb_ccbfjj","tc_cgjgb_sfkjm","tc_cgjgb_jmdj","tc_cgjgb_sjzj","tc_cgjgb_lrr","tc_cgjgb_lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"dqbm","bjjbbm","tccplbbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Tc_cgjgbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
		sql[0]="delete from tc_cgjgb where "+chooseitem;
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
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="5%">����</td>
	<td  width="5%">��������</td>
	<td  width="5%">���ۼ���</td>
	<td  width="7%">���ۼ�������</td>
	<td  width="5%">��ƷС�����</td>
	<td  width="8%">��ƷС��</td>
	<td  width="8%">��Ʒ����</td>
	<td  width="5%">�Ƿ�Ҫ����ͬƷ��</td>
	<td  width="5%">������λ</td>
	<td  width="5%">��׼����</td>
	<td  width="5%">��׼���</td>
	<td  width="5%">�������ּӼ�</td>
	<td  width="5%">�Ƿ�ɼ���</td>
	<td  width="5%">���ⵥ��</td>
	<td  width="5%">�����ۼ�</td>
	<td  width="5%">¼����</td>
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