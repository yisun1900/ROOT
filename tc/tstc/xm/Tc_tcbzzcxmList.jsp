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
	String tc_tczcxm_bjbbh=null;
	String tc_tczcxm_dqbm=null;
	String tc_tczcxm_bjjbbm=null;
	String tc_tczcxm_hxbm=null;
	String tc_tczcxm_jgwzbm=null;
	String tc_tczcxm_tccplbbm=null;
	String sfxzsl=null;
	String tc_tczcxm_lrr=null;
	String tc_tczcxm_lrsj=null;

	String sfyqxtpp=null;
	sfyqxtpp=request.getParameter("sfyqxtpp");
	if (sfyqxtpp!=null)
	{
		sfyqxtpp=cf.GB2Uni(sfyqxtpp);
		if (!(sfyqxtpp.equals("")))	wheresql+=" and  (tc_tczcxm.sfyqxtpp='"+sfyqxtpp+"')";
	}

	String tcsjflbm=null;
	tcsjflbm=request.getParameter("tcsjflbm");
	if (tcsjflbm!=null)
	{
		tcsjflbm=cf.GB2Uni(tcsjflbm);
		if (!(tcsjflbm.equals("")))	wheresql+=" and  (tc_tczcxm.tcsjflbm='"+tcsjflbm+"')";
	}

	String sfbxx=null;
	sfbxx=request.getParameter("sfbxx");
	if (sfbxx!=null)
	{
		sfbxx=cf.GB2Uni(sfbxx);
		if (!(sfbxx.equals("")))	wheresql+=" and  (tc_tczcxm.sfbxx='"+sfbxx+"')";
	}
	String sfyxsj=null;
	sfyxsj=request.getParameter("sfyxsj");
	if (sfyxsj!=null)
	{
		sfyxsj=cf.GB2Uni(sfyxsj);
		if (!(sfyxsj.equals("")))	wheresql+=" and  (tc_tczcxm.sfyxsj='"+sfyxsj+"')";
	}
	
	tc_tczcxm_bjbbh=request.getParameter("tc_tczcxm_bjbbh");
	if (tc_tczcxm_bjbbh!=null)
	{
		tc_tczcxm_bjbbh=cf.GB2Uni(tc_tczcxm_bjbbh);
		if (!(tc_tczcxm_bjbbh.equals("")))	wheresql+=" and  (tc_tczcxm.bjbbh='"+tc_tczcxm_bjbbh+"')";
	}
	tc_tczcxm_dqbm=request.getParameter("tc_tczcxm_dqbm");
	if (tc_tczcxm_dqbm!=null)
	{
		tc_tczcxm_dqbm=cf.GB2Uni(tc_tczcxm_dqbm);
		if (!(tc_tczcxm_dqbm.equals("")))	wheresql+=" and  (tc_tczcxm.dqbm='"+tc_tczcxm_dqbm+"')";
	}
	tc_tczcxm_bjjbbm=request.getParameter("tc_tczcxm_bjjbbm");
	if (tc_tczcxm_bjjbbm!=null)
	{
		tc_tczcxm_bjjbbm=cf.GB2Uni(tc_tczcxm_bjjbbm);
		if (!(tc_tczcxm_bjjbbm.equals("")))	wheresql+=" and  (tc_tczcxm.bjjbbm='"+tc_tczcxm_bjjbbm+"')";
	}
	tc_tczcxm_hxbm=request.getParameter("tc_tczcxm_hxbm");
	if (tc_tczcxm_hxbm!=null)
	{
		tc_tczcxm_hxbm=cf.GB2Uni(tc_tczcxm_hxbm);
		if (!(tc_tczcxm_hxbm.equals("")))	wheresql+=" and  (tc_tczcxm.hxbm='"+tc_tczcxm_hxbm+"')";
	}
	tc_tczcxm_jgwzbm=request.getParameter("tc_tczcxm_jgwzbm");
	if (tc_tczcxm_jgwzbm!=null)
	{
		tc_tczcxm_jgwzbm=cf.GB2Uni(tc_tczcxm_jgwzbm);
		if (!(tc_tczcxm_jgwzbm.equals("")))	wheresql+=" and  (tc_tczcxm.jgwzbm='"+tc_tczcxm_jgwzbm+"')";
	}
	tc_tczcxm_tccplbbm=request.getParameter("tc_tczcxm_tccplbbm");
	if (tc_tczcxm_tccplbbm!=null)
	{
		tc_tczcxm_tccplbbm=cf.GB2Uni(tc_tczcxm_tccplbbm);
		if (!(tc_tczcxm_tccplbbm.equals("")))	wheresql+=" and  (tc_tczcxm.tccplbbm='"+tc_tczcxm_tccplbbm+"')";
	}
	sfxzsl=request.getParameter("sfxzsl");
	if (sfxzsl!=null)
	{
		sfxzsl=cf.GB2Uni(sfxzsl);
		if (!(sfxzsl.equals("")))	wheresql+=" and  (tc_tczcxm.sfxzsl='"+sfxzsl+"')";
	}
	tc_tczcxm_lrr=request.getParameter("tc_tczcxm_lrr");
	if (tc_tczcxm_lrr!=null)
	{
		tc_tczcxm_lrr=cf.GB2Uni(tc_tczcxm_lrr);
		if (!(tc_tczcxm_lrr.equals("")))	wheresql+=" and  (tc_tczcxm.lrr='"+tc_tczcxm_lrr+"')";
	}
	tc_tczcxm_lrsj=request.getParameter("tc_tczcxm_lrsj");
	if (tc_tczcxm_lrsj!=null)
	{
		tc_tczcxm_lrsj=tc_tczcxm_lrsj.trim();
		if (!(tc_tczcxm_lrsj.equals("")))	wheresql+="  and (tc_tczcxm.lrsj>=TO_DATE('"+tc_tczcxm_lrsj+"','YYYY/MM/DD'))";
	}
	tc_tczcxm_lrsj=request.getParameter("tc_tczcxm_lrsj2");
	if (tc_tczcxm_lrsj!=null)
	{
		tc_tczcxm_lrsj=tc_tczcxm_lrsj.trim();
		if (!(tc_tczcxm_lrsj.equals("")))	wheresql+="  and (tc_tczcxm.lrsj<=TO_DATE('"+tc_tczcxm_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_tczcxm.dqbm,dm_dqbm.dqmc,tc_tczcxm.bjjbbm,bjjbmc,tc_tczcxm.tccpdlbm,jxc_cldlbm.cldlmc,tc_tczcxm.tccplbbm,clxlmc,jldw,tc_tczcxm.bzsl,DECODE(tc_tczcxm.sfxzsl,'1','������','2','��������','3','������') sfxzsl,DECODE(tc_tczcxm.sfbxx,'Y','��','N','��') sfbxx,DECODE(tc_tczcxm.sfyxsj,'Y','��','N','��') sfyxsj,tcsjflmc,DECODE(tc_tczcxm.sfyqxtpp,'Y','��','N','��') sfyqxtpp,tc_tczcxm.lrr,tc_tczcxm.lrsj,DECODE(tc_tczcxm.sfkjm,'1','���ɼ���','2','�ɼ���') sfkjm,yxjmzdsl,jmdj,DECODE(tc_tczcxm.sfkgh,'1','���ɻ�','2','�ɻ�') sfkgh,khzdsl,ghzj ";
	ls_sql+=" FROM tc_tczcxm,dm_dqbm,bdm_bjjbbm,jxc_cldlbm,jxc_clxlbm,bdm_tcsjflbm  ";
    ls_sql+=" where tc_tczcxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tc_tczcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tc_tczcxm.tccpdlbm=jxc_cldlbm.cldlbm(+)";
    ls_sql+=" and tc_tczcxm.tcsjflbm=bdm_tcsjflbm.tcsjflbm(+)";
    ls_sql+=" and tc_tczcxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_tczcxm.dqbm,tc_tczcxm.bjjbbm,tc_tczcxm.tccpdlbm,tc_tczcxm.tcsjflbm,tc_tczcxm.tccplbbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Tc_tcbzzcxmList.jsp","","","EditTc_tczcxm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��

	String[] disColName={"dqmc","bjjbmc","cldlmc","tcsjflmc","clxlmc","sfxzsl","jldw","bzsl","sfbxx","sfyxsj","sfyqxtpp","sfkjm","yxjmzdsl","jmdj","sfkgh","khzdsl","ghzj","lrr","lrsj"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"dqbm","bjjbbm","tccpdlbm","tccplbbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Tc_tcbzzcxmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);


//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dqmc","1");//�в����������Hash��
	spanColHash.put("bjjbmc","1");//�в����������Hash��
	spanColHash.put("cldlmc","1");//�в����������Hash��
	spanColHash.put("tcsjflmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from tc_tczcxm where "+chooseitem;
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
  <B><font size="3">�ײͱ�׼������Ŀ��ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">����</td>
	<td  width="5%">���ۼ���</td>
	<td  width="7%">��Ʒ����</td>
	<td  width="9%">�ײ���������</td>
	<td  width="9%">��ƷС��</td>
	<td  width="5%">�Ƿ���������</td>
	<td  width="4%">������λ</td>
	<td  width="6%">��׼����</td>
	<td  width="4%">�Ƿ��ѡ��</td>
	<td  width="4%">�����Ƿ��շ�</td>
	<td  width="4%">�Ƿ�Ҫ����ͬƷ��</td>
	<td  width="4%">�Ƿ�ɼ���</td>
	<td  width="4%">��������������</td>
	<td  width="5%">���ⵥ��</td>
	<td  width="3%">�Ƿ�ɸ���</td>
	<td  width="4%">�ɻ��������</td>
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