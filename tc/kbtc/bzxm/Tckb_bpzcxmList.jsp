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
	String tckb_bpzcxm_dqbm=null;
	String tckb_bpzcxm_bjjbbm=null;
	String tckb_bpzcxm_hxbm=null;
	String tckb_bpzcxm_jgwzbm=null;
	String tckb_bpzcxm_kbcpbm=null;

	String tckb_bpzcxm_lrr=null;
	String tckb_bpzcxm_lrsj=null;

	String sfksc=null;
	sfksc=request.getParameter("sfksc");
	if (sfksc!=null)
	{
		sfksc=cf.GB2Uni(sfksc);
		if (!(sfksc.equals("")))	wheresql+=" and  (tckb_bpzcxm.sfksc='"+sfksc+"')";
	}

	String sfkth=null;
	sfkth=request.getParameter("sfkth");
	if (sfkth!=null)
	{
		sfkth=cf.GB2Uni(sfkth);
		if (!(sfkth.equals("")))	wheresql+=" and  (tckb_bpzcxm.sfkth='"+sfkth+"')";
	}

	String bjbbh=null;
	bjbbh=request.getParameter("bjbbh");
	if (bjbbh!=null)
	{
		bjbbh=cf.GB2Uni(bjbbh);
		if (!(bjbbh.equals("")))	wheresql+=" and  (tckb_bpzcxm.bjbbh='"+bjbbh+"')";
	}
	String kbwlbm=null;
	kbwlbm=request.getParameter("kbwlbm");
	if (kbwlbm!=null)
	{
		kbwlbm=cf.GB2Uni(kbwlbm);
		if (!(kbwlbm.equals("")))	wheresql+=" and  (tckb_bpzcxm.kbwlbm='"+kbwlbm+"')";
	}

	
	tckb_bpzcxm_dqbm=request.getParameter("tckb_bpzcxm_dqbm");
	if (tckb_bpzcxm_dqbm!=null)
	{
		tckb_bpzcxm_dqbm=cf.GB2Uni(tckb_bpzcxm_dqbm);
		if (!(tckb_bpzcxm_dqbm.equals("")))	wheresql+=" and  (tckb_bpzcxm.dqbm='"+tckb_bpzcxm_dqbm+"')";
	}
	tckb_bpzcxm_bjjbbm=request.getParameter("tckb_bpzcxm_bjjbbm");
	if (tckb_bpzcxm_bjjbbm!=null)
	{
		tckb_bpzcxm_bjjbbm=cf.GB2Uni(tckb_bpzcxm_bjjbbm);
		if (!(tckb_bpzcxm_bjjbbm.equals("")))	wheresql+=" and  (tckb_bpzcxm.bjjbbm='"+tckb_bpzcxm_bjjbbm+"')";
	}
	tckb_bpzcxm_hxbm=request.getParameter("tckb_bpzcxm_hxbm");
	if (tckb_bpzcxm_hxbm!=null)
	{
		tckb_bpzcxm_hxbm=cf.GB2Uni(tckb_bpzcxm_hxbm);
		if (!(tckb_bpzcxm_hxbm.equals("")))	wheresql+=" and  (tckb_bpzcxm.hxbm='"+tckb_bpzcxm_hxbm+"')";
	}
	tckb_bpzcxm_jgwzbm=request.getParameter("tckb_bpzcxm_jgwzbm");
	if (tckb_bpzcxm_jgwzbm!=null)
	{
		tckb_bpzcxm_jgwzbm=cf.GB2Uni(tckb_bpzcxm_jgwzbm);
		if (!(tckb_bpzcxm_jgwzbm.equals("")))	wheresql+=" and  (tckb_bpzcxm.jgwzbm='"+tckb_bpzcxm_jgwzbm+"')";
	}
	tckb_bpzcxm_kbcpbm=request.getParameter("tckb_bpzcxm_kbcpbm");
	if (tckb_bpzcxm_kbcpbm!=null)
	{
		tckb_bpzcxm_kbcpbm=cf.GB2Uni(tckb_bpzcxm_kbcpbm);
		if (!(tckb_bpzcxm_kbcpbm.equals("")))	wheresql+=" and  (tckb_bpzcxm.kbcpbm='"+tckb_bpzcxm_kbcpbm+"')";
	}

	tckb_bpzcxm_lrr=request.getParameter("tckb_bpzcxm_lrr");
	if (tckb_bpzcxm_lrr!=null)
	{
		tckb_bpzcxm_lrr=cf.GB2Uni(tckb_bpzcxm_lrr);
		if (!(tckb_bpzcxm_lrr.equals("")))	wheresql+=" and  (tckb_bpzcxm.lrr='"+tckb_bpzcxm_lrr+"')";
	}
	tckb_bpzcxm_lrsj=request.getParameter("tckb_bpzcxm_lrsj");
	if (tckb_bpzcxm_lrsj!=null)
	{
		tckb_bpzcxm_lrsj=tckb_bpzcxm_lrsj.trim();
		if (!(tckb_bpzcxm_lrsj.equals("")))	wheresql+="  and (tckb_bpzcxm.lrsj>=TO_DATE('"+tckb_bpzcxm_lrsj+"','YYYY/MM/DD'))";
	}
	tckb_bpzcxm_lrsj=request.getParameter("tckb_bpzcxm_lrsj2");
	if (tckb_bpzcxm_lrsj!=null)
	{
		tckb_bpzcxm_lrsj=tckb_bpzcxm_lrsj.trim();
		if (!(tckb_bpzcxm_lrsj.equals("")))	wheresql+="  and (tckb_bpzcxm.lrsj<=TO_DATE('"+tckb_bpzcxm_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT bjbbh,tckb_bpzcxm.dqbm,dm_dqbm.dqmc,tckb_bpzcxm.bjjbbm,bjjbmc,tckb_bpzcxm.hxbm,hxmc,tckb_bpzcxm.jgwzbm,tckb_bpzcxm.kbwlbm,tckb_bpzcxm.kbcpbm,tckb_zck.ppmc,tckb_zck.cpmc,tckb_zck.xh,tckb_bpzcxm.jldw,tckb_bpzcxm.sl,tckb_bpzcxm.dj,DECODE(tckb_bpzcxm.sfksc,'Y','��ɾ��','N','��') sfksc,DECODE(tckb_bpzcxm.sfkth,'Y','�������滻','N','�����滻','T','ͬ���滻') sfkth,tckb_bpzcxm.lrr,tckb_bpzcxm.lrsj  ";
	ls_sql+=" FROM tckb_bpzcxm,dm_dqbm,bdm_bjjbbm,dm_hxbm,tckb_zck  ";
    ls_sql+=" where tckb_bpzcxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tckb_bpzcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tckb_bpzcxm.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and tckb_bpzcxm.kbwlbm=tckb_zck.kbwlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tckb_bpzcxm.dqbm,tckb_bpzcxm.bjjbbm,bjbbh,tckb_bpzcxm.hxbm,tckb_bpzcxm.jgwzbm,tckb_bpzcxm.kbcpbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Tckb_bpzcxmList.jsp","","","EditTckb_bpzcxm.jsp");
	pageObj.setPageRow(19);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"bjbbh","dqmc","bjjbmc","hxmc","jgwzbm","kbwlbm","kbcpbm","ppmc","cpmc","xh" ,"jldw","sl","dj","sfksc","sfkth","lrr","lrsj"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"bjbbh","dqbm","bjjbbm","hxbm","jgwzbm","kbwlbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Tckb_bpzcxmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0,1,1,1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from tckb_bpzcxm where "+chooseitem;
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
	pageObj.printPageLink(230);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="6%">���۰汾��</td>
	<td  width="4%">����</td>
	<td  width="4%">���ۼ���</td>
	<td  width="6%">����</td>
	<td  width="6%">�ṹλ��</td>
	<td  width="6%">�Ʊ����ϱ���</td>
	<td  width="6%">�Ʊ���Ʒ����</td>
	<td  width="7%">Ʒ��</td>
	<td  width="12%">��Ʒ����</td>
	<td  width="12%">�ͺ�</td>
	<td  width="4%">������λ</td>
	<td  width="4%">��������</td>
	<td  width="4%">����</td>
	<td  width="4%">�Ƿ��ɾ��</td>
	<td  width="4%">�Ƿ���滻</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
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