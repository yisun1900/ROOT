<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String rs_jfjl_jfjlh=null;
	String rs_jfjl_ygbh=null;
	String rs_jfjl_yhmc=null;
	String rs_jfjl_bianhao=null;
	String rs_jfjl_sfzh=null;
	String rs_jfjl_xzzwbm=null;
	String rs_jfjl_dwbh=null;
	String rs_jfjl_ssfgs=null;
	String rs_jfjl_rzsj=null;
	String rs_jfjl_lx=null;
	String rs_jfjl_jflxbm=null;
	String rs_jfjl_jfje=null;
	String rs_jfjl_jfrq=null;
	String rs_jfjl_jfzfrq=null;
	String rs_jfjl_lrr=null;
	String rs_jfjl_lrsj=null;
	String rs_jfjl_lrbm=null;
	rs_jfjl_jfjlh=request.getParameter("rs_jfjl_jfjlh");
	if (rs_jfjl_jfjlh!=null)
	{
		rs_jfjl_jfjlh=rs_jfjl_jfjlh.trim();
		if (!(rs_jfjl_jfjlh.equals("")))	wheresql+=" and (rs_jfjl.jfjlh="+rs_jfjl_jfjlh+") ";
	}
	rs_jfjl_ygbh=request.getParameter("rs_jfjl_ygbh");
	if (rs_jfjl_ygbh!=null)
	{
		rs_jfjl_ygbh=rs_jfjl_ygbh.trim();
		if (!(rs_jfjl_ygbh.equals("")))	wheresql+=" and (rs_jfjl.ygbh="+rs_jfjl_ygbh+") ";
	}
	rs_jfjl_yhmc=request.getParameter("rs_jfjl_yhmc");
	if (rs_jfjl_yhmc!=null)
	{
		rs_jfjl_yhmc=cf.GB2Uni(rs_jfjl_yhmc);
		if (!(rs_jfjl_yhmc.equals("")))	wheresql+=" and  (rs_jfjl.yhmc='"+rs_jfjl_yhmc+"')";
	}
	rs_jfjl_bianhao=request.getParameter("rs_jfjl_bianhao");
	if (rs_jfjl_bianhao!=null)
	{
		rs_jfjl_bianhao=cf.GB2Uni(rs_jfjl_bianhao);
		if (!(rs_jfjl_bianhao.equals("")))	wheresql+=" and  (rs_jfjl.bianhao='"+rs_jfjl_bianhao+"')";
	}
	rs_jfjl_sfzh=request.getParameter("rs_jfjl_sfzh");
	if (rs_jfjl_sfzh!=null)
	{
		rs_jfjl_sfzh=cf.GB2Uni(rs_jfjl_sfzh);
		if (!(rs_jfjl_sfzh.equals("")))	wheresql+=" and  (rs_jfjl.sfzh='"+rs_jfjl_sfzh+"')";
	}
	rs_jfjl_xzzwbm=request.getParameter("rs_jfjl_xzzwbm");
	if (rs_jfjl_xzzwbm!=null)
	{
		rs_jfjl_xzzwbm=cf.GB2Uni(rs_jfjl_xzzwbm);
		if (!(rs_jfjl_xzzwbm.equals("")))	wheresql+=" and  (rs_jfjl.xzzwbm='"+rs_jfjl_xzzwbm+"')";
	}
	rs_jfjl_dwbh=request.getParameter("rs_jfjl_dwbh");
	if (rs_jfjl_dwbh!=null)
	{
		rs_jfjl_dwbh=cf.GB2Uni(rs_jfjl_dwbh);
		if (!(rs_jfjl_dwbh.equals("")))	wheresql+=" and  (rs_jfjl.dwbh='"+rs_jfjl_dwbh+"')";
	}
	rs_jfjl_ssfgs=request.getParameter("rs_jfjl_ssfgs");
	if (rs_jfjl_ssfgs!=null)
	{
		rs_jfjl_ssfgs=cf.GB2Uni(rs_jfjl_ssfgs);
		if (!(rs_jfjl_ssfgs.equals("")))	wheresql+=" and  (rs_jfjl.ssfgs='"+rs_jfjl_ssfgs+"')";
	}
	rs_jfjl_rzsj=request.getParameter("rs_jfjl_rzsj");
	if (rs_jfjl_rzsj!=null)
	{
		rs_jfjl_rzsj=rs_jfjl_rzsj.trim();
		if (!(rs_jfjl_rzsj.equals("")))	wheresql+="  and (rs_jfjl.rzsj>=TO_DATE('"+rs_jfjl_rzsj+"','YYYY/MM/DD'))";
	}
	rs_jfjl_rzsj=request.getParameter("rs_jfjl_rzsj2");
	if (rs_jfjl_rzsj!=null)
	{
		rs_jfjl_rzsj=rs_jfjl_rzsj.trim();
		if (!(rs_jfjl_rzsj.equals("")))	wheresql+="  and (rs_jfjl.rzsj<=TO_DATE('"+rs_jfjl_rzsj+"','YYYY/MM/DD'))";
	}
	rs_jfjl_lx=request.getParameter("rs_jfjl_lx");
	if (rs_jfjl_lx!=null)
	{
		rs_jfjl_lx=cf.GB2Uni(rs_jfjl_lx);
		if (!(rs_jfjl_lx.equals("")))	wheresql+=" and  (rs_jfjl.lx='"+rs_jfjl_lx+"')";
	}
	rs_jfjl_jflxbm=request.getParameter("rs_jfjl_jflxbm");
	if (rs_jfjl_jflxbm!=null)
	{
		rs_jfjl_jflxbm=cf.GB2Uni(rs_jfjl_jflxbm);
		if (!(rs_jfjl_jflxbm.equals("")))	wheresql+=" and  (rs_jfjl.jflxbm='"+rs_jfjl_jflxbm+"')";
	}
	rs_jfjl_jfje=request.getParameter("rs_jfjl_jfje");
	if (rs_jfjl_jfje!=null)
	{
		rs_jfjl_jfje=rs_jfjl_jfje.trim();
		if (!(rs_jfjl_jfje.equals("")))	wheresql+=" and  (rs_jfjl.jfje="+rs_jfjl_jfje+") ";
	}
	rs_jfjl_jfrq=request.getParameter("rs_jfjl_jfrq");
	if (rs_jfjl_jfrq!=null)
	{
		rs_jfjl_jfrq=rs_jfjl_jfrq.trim();
		if (!(rs_jfjl_jfrq.equals("")))	wheresql+="  and (rs_jfjl.jfrq>=TO_DATE('"+rs_jfjl_jfrq+"','YYYY/MM/DD'))";
	}
	rs_jfjl_jfrq=request.getParameter("rs_jfjl_jfrq2");
	if (rs_jfjl_jfrq!=null)
	{
		rs_jfjl_jfrq=rs_jfjl_jfrq.trim();
		if (!(rs_jfjl_jfrq.equals("")))	wheresql+="  and (rs_jfjl.jfrq<=TO_DATE('"+rs_jfjl_jfrq+"','YYYY/MM/DD'))";
	}
	rs_jfjl_jfzfrq=request.getParameter("rs_jfjl_jfzfrq");
	if (rs_jfjl_jfzfrq!=null)
	{
		rs_jfjl_jfzfrq=rs_jfjl_jfzfrq.trim();
		if (!(rs_jfjl_jfzfrq.equals("")))	wheresql+="  and (rs_jfjl.jfzfrq>=TO_DATE('"+rs_jfjl_jfzfrq+"','YYYY/MM/DD'))";
	}
	rs_jfjl_jfzfrq=request.getParameter("rs_jfjl_jfzfrq2");
	if (rs_jfjl_jfzfrq!=null)
	{
		rs_jfjl_jfzfrq=rs_jfjl_jfzfrq.trim();
		if (!(rs_jfjl_jfzfrq.equals("")))	wheresql+="  and (rs_jfjl.jfzfrq<=TO_DATE('"+rs_jfjl_jfzfrq+"','YYYY/MM/DD'))";
	}
	rs_jfjl_lrr=request.getParameter("rs_jfjl_lrr");
	if (rs_jfjl_lrr!=null)
	{
		rs_jfjl_lrr=cf.GB2Uni(rs_jfjl_lrr);
		if (!(rs_jfjl_lrr.equals("")))	wheresql+=" and  (rs_jfjl.lrr='"+rs_jfjl_lrr+"')";
	}
	rs_jfjl_lrsj=request.getParameter("rs_jfjl_lrsj");
	if (rs_jfjl_lrsj!=null)
	{
		rs_jfjl_lrsj=rs_jfjl_lrsj.trim();
		if (!(rs_jfjl_lrsj.equals("")))	wheresql+="  and (rs_jfjl.lrsj>=TO_DATE('"+rs_jfjl_lrsj+"','YYYY/MM/DD'))";
	}
	rs_jfjl_lrsj=request.getParameter("rs_jfjl_lrsj2");
	if (rs_jfjl_lrsj!=null)
	{
		rs_jfjl_lrsj=rs_jfjl_lrsj.trim();
		if (!(rs_jfjl_lrsj.equals("")))	wheresql+="  and (rs_jfjl.lrsj<=TO_DATE('"+rs_jfjl_lrsj+"','YYYY/MM/DD'))";
	}
	rs_jfjl_lrbm=request.getParameter("rs_jfjl_lrbm");
	if (rs_jfjl_lrbm!=null)
	{
		rs_jfjl_lrbm=cf.GB2Uni(rs_jfjl_lrbm);
		if (!(rs_jfjl_lrbm.equals("")))	wheresql+=" and  (rs_jfjl.lrbm='"+rs_jfjl_lrbm+"')";
	}

	String zt=null;
	zt=request.getParameter("zt");
	if (zt!=null)
	{
		zt=cf.GB2Uni(zt);
		if (!(zt.equals("")))	wheresql+=" and  (rs_jfjl.zt='"+zt+"')";
	}

	ls_sql="SELECT TO_CHAR(rs_jfjl.jfjlh) jfjlh, DECODE(rs_jfjl.zt,'1','δ֧��','2','��֧��'), DECODE(rs_jfjl.lx,'1','����','2','����'),jflxmc,DECODE(rs_jfjl.lx,'1',-1*rs_jfjl.jfje,'2',rs_jfjl.jfje),rs_jfjl.jfrq,rs_jfjl.jfzfrq,TO_CHAR(rs_jfjl.ygbh) ygbh,rs_jfjl.yhmc,rs_jfjl.bianhao,sq_yhxx.sfzh,sq_yhxx.xzzwbm,a.dwmc ssbm,b.dwmc ssfgs,sq_yhxx.rzsj,rs_jfjl.jfsy,rs_jfjl.zflrr,rs_jfjl.zflrsj,rs_jfjl.lrr,rs_jfjl.lrsj,c.dwmc lrbm,rs_jfjl.bz  ";
	ls_sql+=" FROM rs_jfjl,sq_dwxx a,sq_dwxx b,sq_dwxx c,dm_jflxbm,sq_yhxx  ";
    ls_sql+=" where sq_yhxx.dwbh=a.dwbh(+) and sq_yhxx.ssfgs=b.dwbh(+) and rs_jfjl.lrbm=c.dwbh(+) and rs_jfjl.jflxbm=dm_jflxbm.jflxbm(+)";
    ls_sql+=" and rs_jfjl.ygbh=sq_yhxx.ygbh(+)";
    ls_sql+=wheresql;
	ls_sql+=" order by  rs_jfjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_jfjlZfList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jfjlh","rs_jfjl_ygbh","rs_jfjl_yhmc","rs_jfjl_bianhao","rs_jfjl_sfzh","rs_jfjl_xzzwbm","sq_dwxx_dwmc","rs_jfjl_ssfgs","rs_jfjl_rzsj","rs_jfjl_lx","rs_jfjl_jfsy","rs_jfjl_jflxbm","rs_jfjl_jfje","rs_jfjl_jfrq","rs_jfjl_jfzfrq","rs_jfjl_lrr","rs_jfjl_lrsj","rs_jfjl_lrbm","rs_jfjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jfjlh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"����֧��"};//��ť����ʾ����
	String[] buttonLink={"Rs_jfjlZfList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ygbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/rs/yghmcgl/ViewSq_yhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("yhmc",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] jfjlh = request.getParameterValues("jfjlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(jfjlh,"jfjlh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="update rs_jfjl set zt='2',zflrr='"+yhmc+"',zflrsj=SYSDATE where zt='1' and ("+chooseitem+")";
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
  <B><font size="3">����֧��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(310);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">������¼��</td>
	<td  width="2%">״̬</td>
	<td  width="2%">����</td>
	<td  width="7%">��������</td>
	<td  width="3%">�������</td>
	<td  width="3%">��������</td>
	<td  width="3%">����֧������</td>
	<td  width="3%">Ա�����</td>
	<td  width="3%">Ա������</td>
	<td  width="3%">����</td>
	<td  width="6%">���֤��</td>
	<td  width="4%">����ְ��</td>
	<td  width="5%">��������</td>
	<td  width="4%">�����ֹ�˾</td>
	<td  width="3%">��ְ����</td>
	<td  width="21%">��������</td>
	<td  width="2%">֧��¼����</td>
	<td  width="3%">֧��¼��ʱ��</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="5%">¼�벿��</td>
	<td  width="10%">��ע</td>
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