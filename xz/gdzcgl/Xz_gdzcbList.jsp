<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String xz_gdzcb_gsbh=null;
	String xz_gdzcb_gdzcmc=null;
	String xz_gdzcb_bmbh=null;
	String xz_gdzcb_gdzcflbm=null;
	String xz_gdzcb_xh=null;
	String xz_gdzcb_pp=null;
	String xz_gdzcb_grsj=null;
	String xz_gdzcb_bgr=null;
	String xz_gdzcb_dwbh=null;
	String xz_gdzcb_fgsbh=null;
	String xz_gdzcb_sfybf=null;
	String xz_gdzcb_lrr=null;
	String xz_gdzcb_lrsj=null;
	String yjsj=null;

	String pz1=null;
	pz1=request.getParameter("pz1");
	if (pz1!=null)
	{
		pz1=cf.GB2Uni(pz1);
		if (!(pz1.equals("")))	wheresql+=" and  (xz_gdzcb.pz1='"+pz1+"')";
	}
	String pz2=null;
	pz2=request.getParameter("pz2");
	if (pz2!=null)
	{
		pz2=cf.GB2Uni(pz2);
		if (!(pz2.equals("")))	wheresql+=" and  (xz_gdzcb.pz2='"+pz2+"')";
	}
	String pz3=null;
	pz3=request.getParameter("pz3");
	if (pz3!=null)
	{
		pz3=cf.GB2Uni(pz3);
		if (!(pz3.equals("")))	wheresql+=" and  (xz_gdzcb.pz3='"+pz3+"')";
	}
	String pz4=null;
	pz4=request.getParameter("pz4");
	if (pz4!=null)
	{
		pz4=cf.GB2Uni(pz4);
		if (!(pz4.equals("")))	wheresql+=" and  (xz_gdzcb.pz4='"+pz4+"')";
	}
	String pz5=null;
	pz5=request.getParameter("pz5");
	if (pz5!=null)
	{
		pz5=cf.GB2Uni(pz5);
		if (!(pz5.equals("")))	wheresql+=" and  (xz_gdzcb.pz5='"+pz5+"')";
	}
	String pz6=null;
	pz6=request.getParameter("pz6");
	if (pz6!=null)
	{
		pz6=cf.GB2Uni(pz6);
		if (!(pz6.equals("")))	wheresql+=" and  (xz_gdzcb.pz6='"+pz6+"')";
	}


	String lrbm=null;
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
		if (!(lrbm.equals("")))	wheresql+=" and  (xz_gdzcb.lrbm='"+lrbm+"')";
	}
	String ssfgsbh=null;
	ssfgsbh=request.getParameter("ssfgsbh");
	if (ssfgsbh!=null)
	{
		ssfgsbh=cf.GB2Uni(ssfgsbh);
		if (!(ssfgsbh.equals("")))	wheresql+=" and  (xz_gdzcssfw.fgsbh='"+ssfgsbh+"')";
	}
	
	xz_gdzcb_gsbh=request.getParameter("xz_gdzcb_gsbh");
	if (xz_gdzcb_gsbh!=null)
	{
		xz_gdzcb_gsbh=cf.GB2Uni(xz_gdzcb_gsbh);
		if (!(xz_gdzcb_gsbh.equals("")))	wheresql+=" and  (xz_gdzcb.gsbh='"+xz_gdzcb_gsbh+"')";
	}
	xz_gdzcb_gdzcmc=request.getParameter("xz_gdzcb_gdzcmc");
	if (xz_gdzcb_gdzcmc!=null)
	{
		xz_gdzcb_gdzcmc=cf.GB2Uni(xz_gdzcb_gdzcmc);
		if (!(xz_gdzcb_gdzcmc.equals("")))	wheresql+=" and  (xz_gdzcb.gdzcmc like '%"+xz_gdzcb_gdzcmc+"%')";
	}
	xz_gdzcb_bmbh=request.getParameter("xz_gdzcb_bmbh");
	if (xz_gdzcb_bmbh!=null)
	{
		xz_gdzcb_bmbh=cf.GB2Uni(xz_gdzcb_bmbh);
		if (!(xz_gdzcb_bmbh.equals("")))	wheresql+=" and  (xz_gdzcb.bmbh='"+xz_gdzcb_bmbh+"')";
	}
	xz_gdzcb_gdzcflbm=request.getParameter("xz_gdzcb_gdzcflbm");
	if (xz_gdzcb_gdzcflbm!=null)
	{
		xz_gdzcb_gdzcflbm=cf.GB2Uni(xz_gdzcb_gdzcflbm);
		if (!(xz_gdzcb_gdzcflbm.equals("")))	wheresql+=" and  (xz_gdzcb.gdzcflbm='"+xz_gdzcb_gdzcflbm+"')";
	}
	xz_gdzcb_xh=request.getParameter("xz_gdzcb_xh");
	if (xz_gdzcb_xh!=null)
	{
		xz_gdzcb_xh=cf.GB2Uni(xz_gdzcb_xh);
		if (!(xz_gdzcb_xh.equals("")))	wheresql+=" and  (xz_gdzcb.xh like '%"+xz_gdzcb_xh+"%')";
	}
	xz_gdzcb_pp=request.getParameter("xz_gdzcb_pp");
	if (xz_gdzcb_pp!=null)
	{
		xz_gdzcb_pp=cf.GB2Uni(xz_gdzcb_pp);
		if (!(xz_gdzcb_pp.equals("")))	wheresql+=" and  (xz_gdzcb.pp like '%"+xz_gdzcb_pp+"%')";
	}
	xz_gdzcb_grsj=request.getParameter("xz_gdzcb_grsj");
	if (xz_gdzcb_grsj!=null)
	{
		xz_gdzcb_grsj=xz_gdzcb_grsj.trim();
		if (!(xz_gdzcb_grsj.equals("")))	wheresql+="  and (xz_gdzcb.grsj>=TO_DATE('"+xz_gdzcb_grsj+"','YYYY/MM/DD'))";
	}
	xz_gdzcb_grsj=request.getParameter("xz_gdzcb_grsj2");
	if (xz_gdzcb_grsj!=null)
	{
		xz_gdzcb_grsj=xz_gdzcb_grsj.trim();
		if (!(xz_gdzcb_grsj.equals("")))	wheresql+="  and (xz_gdzcb.grsj<=TO_DATE('"+xz_gdzcb_grsj+"','YYYY/MM/DD'))";
	}
	xz_gdzcb_bgr=request.getParameter("xz_gdzcb_bgr");
	if (xz_gdzcb_bgr!=null)
	{
		xz_gdzcb_bgr=cf.GB2Uni(xz_gdzcb_bgr);
		if (!(xz_gdzcb_bgr.equals("")))	wheresql+=" and  (xz_gdzcb.bgr like '%"+xz_gdzcb_bgr+"%')";
	}
	xz_gdzcb_dwbh=request.getParameter("xz_gdzcb_dwbh");
	if (xz_gdzcb_dwbh!=null)
	{
		xz_gdzcb_dwbh=cf.GB2Uni(xz_gdzcb_dwbh);
		if (!(xz_gdzcb_dwbh.equals("")))	wheresql+=" and  (xz_gdzcb.dwbh='"+xz_gdzcb_dwbh+"')";
	}
	xz_gdzcb_fgsbh=request.getParameter("xz_gdzcb_fgsbh");
	if (xz_gdzcb_fgsbh!=null)
	{
		xz_gdzcb_fgsbh=cf.GB2Uni(xz_gdzcb_fgsbh);
		if (!(xz_gdzcb_fgsbh.equals("")))	wheresql+=" and  (xz_gdzcb.fgsbh='"+xz_gdzcb_fgsbh+"')";
	}
	xz_gdzcb_sfybf=request.getParameter("xz_gdzcb_sfybf");
	if (xz_gdzcb_sfybf!=null)
	{
		xz_gdzcb_sfybf=cf.GB2Uni(xz_gdzcb_sfybf);
		if (!(xz_gdzcb_sfybf.equals("")))	wheresql+=" and  (xz_gdzcb.sfybf='"+xz_gdzcb_sfybf+"')";
	}
	xz_gdzcb_lrr=request.getParameter("xz_gdzcb_lrr");
	if (xz_gdzcb_lrr!=null)
	{
		xz_gdzcb_lrr=cf.GB2Uni(xz_gdzcb_lrr);
		if (!(xz_gdzcb_lrr.equals("")))	wheresql+=" and  (xz_gdzcb.lrr='"+xz_gdzcb_lrr+"')";
	}
	xz_gdzcb_lrsj=request.getParameter("xz_gdzcb_lrsj");
	if (xz_gdzcb_lrsj!=null)
	{
		xz_gdzcb_lrsj=xz_gdzcb_lrsj.trim();
		if (!(xz_gdzcb_lrsj.equals("")))	wheresql+="  and (xz_gdzcb.lrsj>=TO_DATE('"+xz_gdzcb_lrsj+"','YYYY/MM/DD'))";
	}
	xz_gdzcb_lrsj=request.getParameter("xz_gdzcb_lrsj2");
	if (xz_gdzcb_lrsj!=null)
	{
		xz_gdzcb_lrsj=xz_gdzcb_lrsj.trim();
		if (!(xz_gdzcb_lrsj.equals("")))	wheresql+="  and (xz_gdzcb.lrsj<=TO_DATE('"+xz_gdzcb_lrsj+"','YYYY/MM/DD'))";
	}
	yjsj=request.getParameter("yjsj");
	if (yjsj!=null)
	{
		yjsj=yjsj.trim();
		if (!(yjsj.equals("")))	wheresql+="  and (xz_gdzcb.yjsj>=TO_DATE('"+yjsj+"','YYYY/MM/DD'))";
	}
	yjsj=request.getParameter("yjsj2");
	if (yjsj!=null)
	{
		yjsj=yjsj.trim();
		if (!(yjsj.equals("")))	wheresql+="  and (xz_gdzcb.yjsj<=TO_DATE('"+yjsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT xz_gdzcb.gsbh,xz_gdzcb.gdzcmc,xz_gdzcb.bmbh,xz_gdzcflbm.gdzcflmc,xz_gdzcb.xh,xz_gdzcb.pp,xz_gdzcb.pz1,xz_gdzcb.pz2,xz_gdzcb.pz3,xz_gdzcb.pz4,xz_gdzcb.pz5,xz_gdzcb.pz6,xz_gdzcb.sl,xz_gdzcb.grsj,xz_gdzcb.grj,xz_gdzcb.gzd,xz_gdzcb.yjsj,xz_gdzcb.bgr,a.dwmc bgbm,DECODE(xz_gdzcb.sfybf,'Y','��','N','��') sfybf,xz_gdzcb.lrr,xz_gdzcb.lrsj,xz_gdzcb.bz,b.dwmc ssfgs  ";
	ls_sql+=" FROM sq_dwxx a,sq_dwxx b,xz_gdzcflbm,xz_gdzcb,xz_gdzcssfw  ";
    ls_sql+=" where xz_gdzcb.dwbh=a.dwbh and xz_gdzcb.gdzcflbm=xz_gdzcflbm.gdzcflbm";
    ls_sql+=" and xz_gdzcb.gsbh=xz_gdzcssfw.gsbh and xz_gdzcssfw.fgsbh=b.dwbh";
 
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and xz_gdzcssfw.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and xz_gdzcssfw.fgsbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
   ls_sql+=wheresql;
    ls_sql+=" order by xz_gdzcb.gdzcflbm,xz_gdzcb.gsbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Xz_gdzcbList.jsp","SelectXz_gdzcb.jsp","","EditXz_gdzcb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"gsbh","xz_gdzcb_gdzcmc","xz_gdzcb_bmbh","xz_gdzcflbm_gdzcflmc","xz_gdzcb_xh","xz_gdzcb_pp","xz_gdzcb_sl","xz_gdzcb_grsj","xz_gdzcb_grj","xz_gdzcb_gzd","xz_gdzcb_bgr","sq_dwxx_dwmc","xz_gdzcb_sfybf","xz_gdzcb_lrr","xz_gdzcb_lrsj","xz_gdzcb_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"gsbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Xz_gdzcbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"gsbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewXz_gdzcb.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("gsbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("gsbh","1");//�в����������Hash��
	spanColHash.put("gdzcmc","1");//�в����������Hash��
	spanColHash.put("bmbh","1");//�в����������Hash��
	spanColHash.put("gdzcflmc","1");//�в����������Hash��
	spanColHash.put("xh","1");//�в����������Hash��
	spanColHash.put("pp","1");//�в����������Hash��
	spanColHash.put("pz1","1");//�в����������Hash��
	spanColHash.put("pz2","1");//�в����������Hash��
	spanColHash.put("pz3","1");//�в����������Hash��
	spanColHash.put("pz4","1");//�в����������Hash��
	spanColHash.put("pz5","1");//�в����������Hash��
	spanColHash.put("pz6","1");//�в����������Hash��
	spanColHash.put("sl","1");//�в����������Hash��
	spanColHash.put("grsj","1");//�в����������Hash��
	spanColHash.put("grj","1");//�в����������Hash��
	spanColHash.put("gzd","1");//�в����������Hash��
	spanColHash.put("yjsj","1");//�в����������Hash��
	spanColHash.put("bgr","1");//�в����������Hash��
	spanColHash.put("bgbm","1");//�в����������Hash��
	spanColHash.put("sfybf","1");//�в����������Hash��
	spanColHash.put("lrr","1");//�в����������Hash��
	spanColHash.put("lrsj","1");//�в����������Hash��
	spanColHash.put("bz","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] gsbh = request.getParameterValues("gsbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(gsbh,"gsbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[3];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from xz_gdzcyjjl where "+chooseitem;
		sql[1]="delete from xz_gdzcssfw where "+chooseitem;
		sql[2]="delete from xz_gdzcb where "+chooseitem;
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
  <B><font size="3">�̶��ʲ�ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(310);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">�̶��ʲ����</td>
	<td  width="5%">�̶��ʲ�����</td>
	<td  width="2%">�����ڲ����</td>
	<td  width="4%">�̶��ʲ�����</td>
	<td  width="3%">�ͺ�</td>
	<td  width="3%">Ʒ��</td>
	<td  width="5%">����(CPU)</td>
	<td  width="5%">����(�ڴ�)</td>
	<td  width="5%">����(Ӳ��)</td>
	<td  width="5%">����(����)</td>
	<td  width="5%">����(�Կ�)</td>
	<td  width="5%">����(��ʾ��)</td>
	<td  width="2%">����</td>
	<td  width="3%">����ʱ��</td>
	<td  width="3%">�����</td>
	<td  width="5%">���õ�</td>
	<td  width="3%">�ƽ�ʱ��</td>
	<td  width="2%">������</td>
	<td  width="5%">��ǰ���ܲ���</td>
	<td  width="2%">�Ƿ��ѱ���</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="12%">��ע</td>
	<td  width="5%">�ʲ������ֹ�˾</td>
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