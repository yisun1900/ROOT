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

	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String khbh=null;
	String hth=null;
    String sjs=null;
	String fgs=null;
	String crm_khxx_qyrq=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (cw_sjfjssqb.khbh='"+khbh+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (hth='"+hth+"')";
	}
    sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (sjs='"+sjs+"')";
	}
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (khxm like '%"+khxm+"%')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (lxfs like '%"+lxfs+"%')";
	}
    crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
    sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (sjs='"+sjs+"')";
	}

	String sqr=null;
	String sqsj=null;
	String spr=null;
	String spsj=null;
	String clzt=null;
	sqr=request.getParameter("sqr");
	if (sqr!=null)
	{
		sqr=cf.GB2Uni(sqr);
		if (!(sqr.equals("")))	wheresql+=" and  (sqr='"+sqr+"')";
	}
	sqsj=request.getParameter("sqsj");
	if (sqsj!=null)
	{
		sqsj=sqsj.trim();
		if (!(sqsj.equals("")))	wheresql+="  and (sqsj>=TO_DATE('"+sqsj+"','YYYY/MM/DD'))";
	}
	sqsj=request.getParameter("sqsj2");
	if (sqsj!=null)
	{
		sqsj=sqsj.trim();
		if (!(sqsj.equals("")))	wheresql+="  and (sqsj<=TO_DATE('"+sqsj+"','YYYY/MM/DD'))";
	}
	spr=request.getParameter("spr");
	if (spr!=null)
	{
		spr=cf.GB2Uni(spr);
		if (!(spr.equals("")))	wheresql+=" and  (spr='"+spr+"')";
	}
	spsj=request.getParameter("spsj");
	if (spsj!=null)
	{
		spsj=spsj.trim();
		if (!(spsj.equals("")))	wheresql+="  and (spsj>=TO_DATE('"+spsj+"','YYYY/MM/DD'))";
	}
	spsj=request.getParameter("spsj2");
	if (spsj!=null)
	{
		spsj=spsj.trim();
		if (!(spsj.equals("")))	wheresql+="  and (spsj<=TO_DATE('"+spsj+"','YYYY/MM/DD'))";
	}
	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		clzt=cf.GB2Uni(clzt);
		if (!(clzt.equals("")))	wheresql+=" and  (clzt='"+clzt+"')";
	}
	
	
	
	
	
	
	
	ls_sql="SELECT hth,khxm,fwdz,sfyjqk,fkcsmc,qye,zjxje,sfke,sfkl,qyrq,sjjgrq,sbdm,sgd,sjs,zjxm,khbh ";
    ls_sql+=" from (";
	ls_sql+=" SELECT cw_sjfjssqb.khbh,hth,khxm,DECODE(sfyjqk,'N','δ��','Y','�ѽ�') sfyjqk,fkcsmc,qye,zjxje,sfke,ROUND(sfke/(qye+NVL(zjxje,0))*100,2)||'%' sfkl,fwdz,qyrq,sjjgrq,a.dwmc sbdm,sgdmc sgd,sjs,zjxm ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,cw_fkcs,cw_sjfjssqb";
    ls_sql+=" where (crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+))";
    ls_sql+=" and crm_khxx.jzkfkcs=cw_fkcs.fkcs(+) and cw_sjfjssqb.khbh=crm_khxx.khbh";
    ls_sql+=" and cw_sjfjssqb.clzt in('1')";
    ls_sql+=wheresql;
    ls_sql+=" order by lrsj desc";
    ls_sql+=" )";
    ls_sql+=" where rownum<50 ";
	//out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_sjsjsjlSjfSqXgList.jsp","SelectSjfSqXgCw_sjsjsjl.jsp","","");
	pageObj.setPageRow(50);//����ÿҳ��ʾ��¼��
	pageObj.setEditStr("����");
	pageObj.setEditBolt("");
/*
//������ʾ��
	String[] disColName={"jsjlh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_sjs","crm_khxx_hth","crm_khxx_dwbh","crm_khxx_sgd","cw_jsjl_fkqx","cw_jsjl_fkbz","cw_jsjl_gcqye","cw_jsjl_yfkze","cw_jsjl_ljyfkze","cw_jsjl_bqyfgck","cw_jsjl_bqyfmmk","cw_jsjl_bqyfcgk","cw_jsjl_bqyfzck","cw_jsjl_bqyfkze","cw_jsjl_bqljyfgck","cw_jsjl_bqljyfmmk","cw_jsjl_bqljyfcgk","cw_jsjl_bqljyfzck","cw_jsjl_bqljyfkze","cw_jsjl_bqyfkbl"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Cw_sjsjsjlSjfSqXgList.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link=" /khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] khbh = request.getParameterValues("khbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(khbh,"khbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from cw_sjfjssqb where clzt='1' and "+chooseitem;
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
  <B><font size="3">��Ʒѽ������룭�޸�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="6%">��ͬ��</td>
	<td  width="4%">����</td>
	<td  width="18%">���ݵ�ַ</td>
	<td  width="4%">�Ƿ�ȫ��</td>
	<td  width="4%">�տ�����</td>
	<td  width="7%">ǩԼ��</td>
	<td  width="5%">������</td>
	<td  width="6%">ʵ�տ��</td>
	<td  width="5%">ʵ�տ���</td>
	<td  width="6%">ǩԼ����</td>
	<td  width="6%">ʵ��������</td>
	<td  width="9%">ǩԼ����</td>
	<td  width="4%">ʩ����</td>
	<td  width="4%">���ʦ</td>
	<td  width="4%">�ʼ�Ա</td>
	<td  width="5%">�ͻ����</td>
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