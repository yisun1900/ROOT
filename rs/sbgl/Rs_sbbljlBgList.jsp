<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String sqygbh=(String)session.getAttribute("ygbh");
String sqfgs=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String ygbh=null;
	String yhmc=null;
	String bianhao=null;
	String sfzh=null;
	String xzzwbm=null;
	String dwbh=null;
	String ssfgs=null;

	String sfcjbx=null;
	sfcjbx=request.getParameter("sfcjbx");
	if (sfcjbx!=null)
	{
		if (!(sfcjbx.equals("")))	wheresql+=" and  (rs_ygsbxx.sfcjbx='"+sfcjbx+"')";
	}
	String ylbx=null;
	ylbx=request.getParameter("ylbx");
	if (ylbx!=null)
	{
		if (!(ylbx.equals("")))	wheresql+=" and  (rs_sbbljl.ylbx='"+ylbx+"')";
	}
	String jylbx=null;
	jylbx=request.getParameter("jylbx");
	if (jylbx!=null)
	{
		if (!(jylbx.equals("")))	wheresql+=" and  (rs_sbbljl.jylbx='"+jylbx+"')";
	}
	String sybx=null;
	sybx=request.getParameter("sybx");
	if (sybx!=null)
	{
		if (!(sybx.equals("")))	wheresql+=" and  (rs_sbbljl.sybx='"+sybx+"')";
	}
	String gsby=null;
	gsby=request.getParameter("gsby");
	if (gsby!=null)
	{
		if (!(gsby.equals("")))	wheresql+=" and  (rs_sbbljl.gsby='"+gsby+"')";
	}
	String syx=null;
	syx=request.getParameter("syx");
	if (syx!=null)
	{
		if (!(syx.equals("")))	wheresql+=" and  (rs_sbbljl.syx='"+syx+"')";
	}
	String shbxh=null;
	shbxh=request.getParameter("shbxh");
	if (shbxh!=null)
	{
		shbxh=cf.GB2Uni(shbxh);
		if (!(shbxh.equals("")))	wheresql+=" and  (rs_sbbljl.shbxh='"+shbxh+"')";
	}
	String yjsxe=null;
	yjsxe=request.getParameter("yjsxe");
	if (yjsxe!=null)
	{
		yjsxe=cf.GB2Uni(yjsxe);
		if (!(yjsxe.equals("")))	wheresql+=" and  (rs_sbbljl.yjsxe='"+yjsxe+"')";
	}
	String sbblsj=null;
	sbblsj=request.getParameter("sbblsj");
	if (sbblsj!=null)
	{
		sbblsj=sbblsj.trim();
		if (!(sbblsj.equals("")))	wheresql+="  and (rs_sbbljl.sbblsj>=TO_DATE('"+sbblsj+"','YYYY/MM/DD'))";
	}
	sbblsj=request.getParameter("sbblsj2");
	if (sbblsj!=null)
	{
		sbblsj=sbblsj.trim();
		if (!(sbblsj.equals("")))	wheresql+="  and (rs_sbbljl.sbblsj<=TO_DATE('"+sbblsj+"','YYYY/MM/DD'))";
	}

	
	String ldhtbh=null;
	ldhtbh=request.getParameter("ldhtbh");
	if (ldhtbh!=null)
	{
		if (!(ldhtbh.equals("")))	wheresql+=" and  (sq_yhxx.ldhtbh='"+ldhtbh+"')";
	}
	String ldhtlx=null;
	ldhtlx=request.getParameter("ldhtlx");
	if (ldhtlx!=null)
	{
		ldhtlx=cf.GB2Uni(ldhtlx);
		if (!(ldhtlx.equals("")))	wheresql+=" and  (sq_yhxx.ldhtlx='"+ldhtlx+"')";
	}
	String ldhtqx=null;
	ldhtqx=request.getParameter("ldhtqx");
	if (ldhtqx!=null)
	{
		ldhtqx=cf.GB2Uni(ldhtqx);
		if (!(ldhtqx.equals("")))	wheresql+=" and  (sq_yhxx.ldhtqx='"+ldhtqx+"')";
	}
	String htksrq=null;
	htksrq=request.getParameter("htksrq");
	if (htksrq!=null)
	{
		htksrq=htksrq.trim();
		if (!(htksrq.equals("")))	wheresql+="  and (sq_yhxx.htksrq>=TO_DATE('"+htksrq+"','YYYY/MM/DD'))";
	}
	htksrq=request.getParameter("htksrq2");
	if (htksrq!=null)
	{
		htksrq=htksrq.trim();
		if (!(htksrq.equals("")))	wheresql+="  and (sq_yhxx.htksrq<=TO_DATE('"+htksrq+"','YYYY/MM/DD'))";
	}
	String htdqrq=null;
	htdqrq=request.getParameter("htdqrq");
	if (htdqrq!=null)
	{
		htdqrq=htdqrq.trim();
		if (!(htdqrq.equals("")))	wheresql+="  and (sq_yhxx.htdqrq>=TO_DATE('"+htdqrq+"','YYYY/MM/DD'))";
	}
	htdqrq=request.getParameter("htdqrq2");
	if (htdqrq!=null)
	{
		htdqrq=htdqrq.trim();
		if (!(htdqrq.equals("")))	wheresql+="  and (sq_yhxx.htdqrq<=TO_DATE('"+htdqrq+"','YYYY/MM/DD'))";
	}

	ygbh=request.getParameter("ygbh");
	if (ygbh!=null)
	{
		ygbh=ygbh.trim();
		if (!(ygbh.equals("")))	wheresql+=" and (rs_sbbljl.ygbh="+ygbh+") ";
	}
	yhmc=request.getParameter("yhmc");
	if (yhmc!=null)
	{
		yhmc=cf.GB2Uni(yhmc);
		if (!(yhmc.equals("")))	wheresql+=" and  (rs_sbbljl.yhmc like '%"+yhmc+"%')";
	}
	bianhao=request.getParameter("bianhao");
	if (bianhao!=null)
	{
		bianhao=cf.GB2Uni(bianhao);
		if (!(bianhao.equals("")))	wheresql+=" and  (rs_sbbljl.bianhao='"+bianhao+"')";
	}
	sfzh=request.getParameter("sfzh");
	if (sfzh!=null)
	{
		sfzh=cf.GB2Uni(sfzh);
		if (!(sfzh.equals("")))	wheresql+=" and  (sq_yhxx.sfzh='"+sfzh+"')";
	}
	xzzwbm=request.getParameter("xzzwbm");
	if (xzzwbm!=null)
	{
		xzzwbm=cf.GB2Uni(xzzwbm);
		if (!(xzzwbm.equals("")))	wheresql+=" and  (sq_yhxx.xzzwbm='"+xzzwbm+"')";
	}

	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+dwbh+"')";
	}

	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+ssfgs+"')";


	ls_sql="SELECT rs_sbbljl.sbbljlh,rs_sbbljl.ygbh,DECODE(sq_yhxx.sfzszg,'M','ʵϰ��','Y','ת��','N','������','D','����','S','��ְ','T','����'),rs_sbbljl.bianhao,rs_sbbljl.yhmc,DECODE(rs_ygsbxx.sfcjbx,'Y','�α�','N','δ����','T','ͣ��','Z','ת��'),rs_sbbljl.shbxh,rs_sbbljl.sbblsj, DECODE(rs_sbbljl.ylbx,'Y','��','N','��'), DECODE(rs_sbbljl.jylbx,'Y','��','N','��'), DECODE(rs_sbbljl.sybx,'Y','��','N','��'), DECODE(rs_sbbljl.gsby,'Y','��','N','��'), DECODE(rs_sbbljl.syx,'Y','��','N','��'),rs_sbbljl.jbxdd,rs_sbbljl.sbzrjs,rs_sbbljl.sbzcjs,rs_sbbljl.bxtjsj,rs_sbbljl.bxzcsj,rs_sbbljl.yjsxe,rs_sbbljl.gsjbfe,rs_sbbljl.grjbfe, DECODE(rs_sbbljl.sfjgjj,'Y','��','N','��'),rs_sbbljl.gsjgjj,rs_sbbljl.grjgjj,sq_yhxx.sfzh,sq_yhxx.xzzwbm,a.dwmc dwbh,b.dwmc ssfgs,rs_sbbljl.lrr,rs_sbbljl.lrsj, DECODE(rs_sbbljl.lx,'1','����','2','���','2','ͣ��','3','ת��'),rs_sbbljl.bz   ";
	ls_sql+=" FROM sq_yhxx,sq_dwxx a,sq_dwxx b,rs_sbbljl,rs_ygsbxx  ";
    ls_sql+=" where sq_yhxx.dwbh=a.dwbh and sq_yhxx.ssfgs=b.dwbh";
	ls_sql+=" and sq_yhxx.ygbh=rs_ygsbxx.ygbh(+)";
	ls_sql+=" and rs_sbbljl.lx!='1'";
    ls_sql+=" and sq_yhxx.ygbh=rs_sbbljl.ygbh";
	if (sqfgs.equals("1") || sqfgs.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and sq_yhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+sqygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_yhxx.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+sqygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by rs_sbbljl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_sbbljlBgList.jsp","SelectBgRs_sbbljl.jsp","","EditBgRs_sbbljl.jsp");
	pageObj.setPageRow(24);
/*
//������ʾ��
	String[] disColName={"xh","ygbh","yhmc","bianhao","sfzh","xzzwbm","lzrq","lzyy","dwbh","ssfgs","lrr","lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"sbbljlh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteBgRs_sbbljl.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
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
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�籣�����ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(320);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">�籣������¼��</td>
	<td  width="3%">Ա�����</td>
	<td  width="3%">Ա��״̬</td>
	<td  width="3%">����</td>
	<td  width="3%">Ա������</td>
	<td  width="2%">�Ƿ�μӱ���</td>
	<td  width="4%">��ᱣ�պ�</td>
	<td  width="3%">�籣����ʱ��</td>
	<td  width="2%">�Ƿ����ҽ�Ʊ���</td>
	<td  width="2%">�Ƿ�������ϱ���</td>
	<td  width="2%">�Ƿ����ʧҵ����</td>
	<td  width="2%">�Ƿ���ɹ��˱���</td>
	<td  width="2%">�Ƿ������������</td>
	<td  width="6%">�ɱ��յص�</td>
	<td  width="2%">ת�����</td>
	<td  width="2%">ת������</td>
	<td  width="2%">����ͣ��ʱ��</td>
	<td  width="2%">����ת��ʱ��</td>
	<td  width="2%">���ɻ���</td>
	<td  width="2%">��˾�����Ѷ�</td>
	<td  width="2%">���˽����Ѷ�</td>
	<td  width="2%">�Ƿ��ס��������</td>
	<td  width="2%">��˾��ס��������</td>
	<td  width="2%">���˽�ס��������</td>
	<td  width="6%">����֤��</td>
	<td  width="4%">����ְ��</td>
	<td  width="5%">��������</td>
	<td  width="5%">������˾</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="2%">����</td>
	<td  width="9%">��ע</td>
</tr>
<%
	pageObj.displayDate();
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