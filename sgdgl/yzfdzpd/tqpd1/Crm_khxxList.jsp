<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String khbh=null;
	String khxm=null;
	String xb=null;
	String fwdz=null;
	String lxfs=null;
	String fgflbm=null;
	String zxjwbm=null;
	String hxmjbm=null;
	String ysbm=null;
	String hth=null;
	String sjs=null;
	String qye=null;
	String sfyyh=null;
	String yhzj=null;
	String qyrq=null;
	String jyjdrq=null;
	String kgrq=null;
	String skje=null;
	String skrq=null;
	String zkje=null;
	String fzxm=null;
	String pdlx=null;
	String zpsgd=null;
	String zpyy=null;

	String hdbz=null;
	String zt=null;
	String khlxbm=null;
	String lrr=null;
	String lrsj=null;


	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String cqbm=null;
	cqbm=request.getParameter("cqbm");
	if (cqbm!=null)
	{
		cqbm=cf.GB2Uni(cqbm);
		if (!(cqbm.equals("")))	wheresql+=" and  (crm_khxx.cqbm='"+cqbm+"')";
	}
	
	String czkbz=null;
	String htshbz=null;
	htshbz=request.getParameter("htshbz");
	if (htshbz!=null)
	{
		if (!(htshbz.equals("")))	wheresql+=" and  (crm_khxx.htshbz!='N')";
	}
	czkbz=request.getParameter("czkbz");
	if (czkbz!=null)
	{
		if (!(czkbz.equals("")))	wheresql+=" and  (crm_khxx.czkbz!='1')";
	}
	
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	xb=request.getParameter("xb");
	if (xb!=null)
	{
		xb=cf.GB2Uni(xb);
		if (!(xb.equals("")))	wheresql+=" and  (crm_khxx.xb='"+xb+"')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}
	fgflbm=request.getParameter("fgflbm");
	if (fgflbm!=null)
	{
		fgflbm=cf.GB2Uni(fgflbm);
		if (!(fgflbm.equals("")))	wheresql+=" and  (crm_khxx.fgflbm='"+fgflbm+"')";
	}
	zxjwbm=request.getParameter("zxjwbm");
	if (zxjwbm!=null)
	{
		zxjwbm=cf.GB2Uni(zxjwbm);
		if (!(zxjwbm.equals("")))	wheresql+=" and  (crm_khxx.zxjwbm='"+zxjwbm+"')";
	}
	hxmjbm=request.getParameter("hxmjbm");
	if (hxmjbm!=null)
	{
		hxmjbm=cf.GB2Uni(hxmjbm);
		if (!(hxmjbm.equals("")))	wheresql+=" and  (crm_khxx.hxmjbm='"+hxmjbm+"')";
	}
	ysbm=request.getParameter("ysbm");
	if (ysbm!=null)
	{
		ysbm=cf.GB2Uni(ysbm);
		if (!(ysbm.equals("")))	wheresql+=" and  (crm_khxx.ysbm='"+ysbm+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	qye=request.getParameter("qye");
	if (qye!=null)
	{
		qye=qye.trim();
		if (!(qye.equals("")))	wheresql+=" and (crm_khxx.qye>="+qye+") ";
	}
	qye=request.getParameter("qye2");
	if (qye!=null)
	{
		qye=qye.trim();
		if (!(qye.equals("")))	wheresql+=" and (crm_khxx.qye<="+qye+") ";
	}
	sfyyh=request.getParameter("sfyyh");
	if (sfyyh!=null)
	{
		sfyyh=cf.GB2Uni(sfyyh);
		if (!(sfyyh.equals("")))	wheresql+=" and  (sfyyh='"+sfyyh+"')";
	}
	yhzj=request.getParameter("yhzj");
	if (yhzj!=null)
	{
		yhzj=yhzj.trim();
		if (!(yhzj.equals("")))	wheresql+=" and (yhzj>="+yhzj+") ";
	}
	yhzj=request.getParameter("yhzj2");
	if (yhzj!=null)
	{
		yhzj=yhzj.trim();
		if (!(yhzj.equals("")))	wheresql+=" and (yhzj<="+yhzj+") ";
	}
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (qyrq>=TO_DATE('"+qyrq+"','YYYY/MM/DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (qyrq<=TO_DATE('"+qyrq+"','YYYY/MM/DD'))";
	}
	jyjdrq=request.getParameter("jyjdrq");
	if (jyjdrq!=null)
	{
		if (!(jyjdrq.equals("")))	wheresql+="  and (jyjdrq>=TO_DATE('"+jyjdrq+"','YYYY/MM/DD'))";
	}
	jyjdrq=request.getParameter("jyjdrq2");
	if (jyjdrq!=null)
	{
		if (!(jyjdrq.equals("")))	wheresql+="  and (jyjdrq<=TO_DATE('"+jyjdrq+"','YYYY/MM/DD'))";
	}
	kgrq=request.getParameter("kgrq");
	if (kgrq!=null)
	{
		kgrq=kgrq.trim();
		if (!(kgrq.equals("")))	wheresql+="  and (kgrq>=TO_DATE('"+kgrq+"','YYYY/MM/DD'))";
	}
	kgrq=request.getParameter("kgrq2");
	if (kgrq!=null)
	{
		kgrq=kgrq.trim();
		if (!(kgrq.equals("")))	wheresql+="  and (kgrq<=TO_DATE('"+kgrq+"','YYYY/MM/DD'))";
	}
	skje=request.getParameter("skje");
	if (skje!=null)
	{
		skje=skje.trim();
		if (!(skje.equals("")))	wheresql+=" and (skje="+skje+") ";
	}
	skrq=request.getParameter("skrq");
	if (skrq!=null)
	{
		skrq=skrq.trim();
		if (!(skrq.equals("")))	wheresql+="  and (skrq>=TO_DATE('"+skrq+"','YYYY/MM/DD'))";
	}
	skrq=request.getParameter("skrq2");
	if (skrq!=null)
	{
		skrq=skrq.trim();
		if (!(skrq.equals("")))	wheresql+="  and (skrq<=TO_DATE('"+skrq+"','YYYY/MM/DD'))";
	}
	zkje=request.getParameter("zkje");
	if (zkje!=null)
	{
		zkje=zkje.trim();
		if (!(zkje.equals("")))	wheresql+=" and (zkje="+zkje+") ";
	}
	fzxm=request.getParameter("fzxm");
	if (fzxm!=null)
	{
		fzxm=cf.GB2Uni(fzxm);
		if (!(fzxm.equals("")))	wheresql+=" and  (fzxm='"+fzxm+"')";
	}

	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_khxx.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_khxx.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	pdlx=request.getParameter("pdlx");
	if (pdlx!=null)
	{
		pdlx=cf.GB2Uni(pdlx);
		if (!(pdlx.equals("")))	wheresql+=" and  (pdlx='"+pdlx+"')";
	}
	zpsgd=request.getParameter("zpsgd");
	if (zpsgd!=null)
	{
		zpsgd=cf.GB2Uni(zpsgd);
		if (!(zpsgd.equals("")))	wheresql+=" and  (zpsgd='"+zpsgd+"')";
	}
	zpyy=request.getParameter("zpyy");
	if (zpyy!=null)
	{
		zpyy=cf.GB2Uni(zpyy);
		if (!(zpyy.equals("")))	wheresql+=" and  (zpyy='"+zpyy+"')";
	}

	hdbz=request.getParameter("hdbz");
	if (hdbz!=null)
	{
		hdbz=cf.GB2Uni(hdbz);
		if (!(hdbz.equals("")))	wheresql+=" and  (hdbz='"+hdbz+"')";
	}
	zt=request.getParameter("zt");
	if (zt!=null)
	{
		zt=cf.GB2Uni(zt);
		if (!(zt.equals("")))	wheresql+=" and  (crm_khxx.zt='"+zt+"')";
	}
	khlxbm=request.getParameter("khlxbm");
	if (khlxbm!=null)
	{
		khlxbm=cf.GB2Uni(khlxbm);
		if (!(khlxbm.equals("")))	wheresql+=" and  (crm_khxx.khlxbm='"+khlxbm+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}

	ls_sql="SELECT distinct crm_khxx.khbh khbh,crm_khxx.hth,DECODE(pdclzt,'1','�����ɵ�','2','�˹��ɵ�','5','�����ɵ�','6','��Ȩ�ɵ�','7','�ܵ�','8','��ʩ����','4','�����޸��ɵ�') pdclzt,DECODE(kgsjqd,'Y','��ȷ��','N','<font color=\"#FF00FF\">δȷ��</font>') kgsjqd,khxm,cqmc,fwdz,crm_khxx.qye,khlxmc";
	ls_sql+=" ,DECODE(hdbz,'1','�ǻص�','2','���ʦ�ص�','3','ʩ���ӻص�','4','�Ͽͻ��ص�','5','Ա���ص�','6','�೤�ص�','7','��¥��','8','������','9','����') hdbz,jyjdrq,crm_khxx.sjs,a.dwmc sqdm,crm_khxx.qyrq,crm_khxx.kgrq";
	ls_sql+=" ,sgdmc sgd";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_cqbm,dm_khlxbm  ";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.cqbm=dm_cqbm.cqbm(+)  and zt='2' ";
    ls_sql+=" and crm_khxx.khlxbm=dm_khlxbm.khlxbm and pdclzt in('1','7')   and gcjdbm!='5'";
	ls_sql+=wheresql;
	ls_sql+=" order by kgsjqd desc,jyjdrq";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;

//���ж����ʼ��
	pageObj.initPage("Crm_khxxList.jsp","SelectCrm_khxx.jsp","","EditCrm_khxxMain.jsp");
//	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName1={"hth","pdclzt","kgsjqd","khxm","cqmc","fwdz","khlxmc","hdbz","jyjdrq","sjs","sqdm","qyrq","kgrq"};
	pageObj.setDisColName(disColName1);
/*
*/

//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("�ɵ�");
//�����г�������
/*
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}

%>

<CENTER ><B>��Ȩ�ɵ�</B></CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="6%">��ͬ��</td>
	<td  width="5%">�ɵ�״̬</td>
	<td  width="4%">����ʱ��</td>
	<td  width="8%">����</td>
	<td  width="6%">����</td>
	<td  width="19%">���ݵ�ַ</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="6%">�ص���־</td>
	<td  width="7%">��������</td>
	<td  width="5%">���ʦ</td>
	<td  width="12%">ǩԼ����</td>
	<td  width="7%">ǩԼ����</td>
	<td  width="7%">Ӧ��������</td>
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
