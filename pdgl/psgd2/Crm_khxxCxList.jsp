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
	String jyjdrq=null;
	String qyrq=null;
	String kgrq=null;
	String skje=null;
	String skrq=null;
	String zkje=null;
	String fzxm=null;
	String lrsj=null;
	String pdlx=null;
	String zpsgd=null;
	String zpyy=null;
	String pdclzt=null;
	String hdbz=null;
	String zt=null;
	String khlxbm=null;
	String lrr=null;

	String hfjl=null;
	hfjl=request.getParameter("hfjl");
	if (hfjl!=null)
	{
		if (!(hfjl.equals("")))	wheresql+=" and  (pd_pdjl.hfjl='"+hfjl+"')";
	}

	String shzzb=null;
	shzzb=request.getParameter("shzzb");
	if (shzzb!=null)
	{
		shzzb=cf.GB2Uni(shzzb);
		if (!(shzzb.equals("")))	wheresql+=" and  (pd_pdjl.shzzb='"+shzzb+"')";
	}
	String pdr=null;
	pdr=request.getParameter("pdr");
	if (pdr!=null)
	{
		pdr=cf.GB2Uni(pdr);
		if (!(pdr.equals("")))	wheresql+=" and  (pd_pdjl.pdr='"+pdr+"')";
	}
	String sgdyxj=null;
	sgdyxj=request.getParameter("sgdyxj");
	if (sgdyxj!=null)
	{
		sgdyxj=cf.GB2Uni(sgdyxj);
		if (!(sgdyxj.equals("")))	wheresql+=" and  (pd_pdjl.sgdyxj>="+sgdyxj+")";
	}
	sgdyxj=request.getParameter("sgdyxj2");
	if (sgdyxj!=null)
	{
		sgdyxj=cf.GB2Uni(sgdyxj);
		if (!(sgdyxj.equals("")))	wheresql+=" and  (pd_pdjl.sgdyxj<="+sgdyxj+")";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String jlbz=null;
	jlbz=request.getParameter("jlbz");
	if (jlbz!=null)
	{
		if (!(jlbz.equals("")))	wheresql+=" and  (pd_pdjl.jlbz='"+jlbz+"')";
	}
	String pdsm=null;
	pdsm=request.getParameter("pdsm");
	if (pdsm!=null)
	{
		pdsm=cf.GB2Uni(pdsm);
		if (!(pdsm.equals("")))	wheresql+=" and  (pd_pdjl.pdsm like '%"+pdsm+"%')";
	}
	String cqbm=null;
	cqbm=request.getParameter("cqbm");
	if (cqbm!=null)
	{
		cqbm=cf.GB2Uni(cqbm);
		if (!(cqbm.equals("")))	wheresql+=" and  (crm_khxx.cqbm='"+cqbm+"')";
	}
	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (pd_pdjl.sgd='"+sgd+"')";
	}
	String pdsj=null;
	pdsj=request.getParameter("pdsj");
	if (pdsj!=null)
	{
		if (!(pdsj.equals("")))	wheresql+="  and (pd_pdjl.pdsj>=TO_DATE('"+pdsj+"','YYYY/MM/DD'))";
	}
	pdsj=request.getParameter("pdsj2");
	if (pdsj!=null)
	{
		if (!(pdsj.equals("")))	wheresql+="  and (pd_pdjl.pdsj<=TO_DATE('"+pdsj+"','YYYY/MM/DD'))";
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
		if (!(sfyyh.equals("")))	wheresql+=" and  (crm_khxx.sfyyh='"+sfyyh+"')";
	}
	yhzj=request.getParameter("yhzj");
	if (yhzj!=null)
	{
		yhzj=yhzj.trim();
		if (!(yhzj.equals("")))	wheresql+=" and (crm_khxx.yhzj>="+yhzj+") ";
	}
	yhzj=request.getParameter("yhzj2");
	if (yhzj!=null)
	{
		yhzj=yhzj.trim();
		if (!(yhzj.equals("")))	wheresql+=" and (crm_khxx.yhzj<="+yhzj+") ";
	}
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY/MM/DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq+"','YYYY/MM/DD'))";
	}
	jyjdrq=request.getParameter("jyjdrq");
	if (jyjdrq!=null)
	{
		if (!(jyjdrq.equals("")))	wheresql+="  and (crm_khxx.jyjdrq>=TO_DATE('"+jyjdrq+"','YYYY/MM/DD'))";
	}
	jyjdrq=request.getParameter("jyjdrq2");
	if (jyjdrq!=null)
	{
		if (!(jyjdrq.equals("")))	wheresql+="  and (crm_khxx.jyjdrq<=TO_DATE('"+jyjdrq+"','YYYY/MM/DD'))";
	}
	kgrq=request.getParameter("kgrq");
	if (kgrq!=null)
	{
		kgrq=kgrq.trim();
		if (!(kgrq.equals("")))	wheresql+="  and (crm_khxx.kgrq>=TO_DATE('"+kgrq+"','YYYY/MM/DD'))";
	}
	kgrq=request.getParameter("kgrq2");
	if (kgrq!=null)
	{
		kgrq=kgrq.trim();
		if (!(kgrq.equals("")))	wheresql+="  and (crm_khxx.kgrq<=TO_DATE('"+kgrq+"','YYYY/MM/DD'))";
	}
	skje=request.getParameter("skje");
	if (skje!=null)
	{
		skje=skje.trim();
		if (!(skje.equals("")))	wheresql+=" and (crm_khxx.skje="+skje+") ";
	}
	skrq=request.getParameter("skrq");
	if (skrq!=null)
	{
		skrq=skrq.trim();
		if (!(skrq.equals("")))	wheresql+="  and (crm_khxx.skrq>=TO_DATE('"+skrq+"','YYYY/MM/DD'))";
	}
	skrq=request.getParameter("skrq2");
	if (skrq!=null)
	{
		skrq=skrq.trim();
		if (!(skrq.equals("")))	wheresql+="  and (crm_khxx.skrq<=TO_DATE('"+skrq+"','YYYY/MM/DD'))";
	}
	zkje=request.getParameter("zkje");
	if (zkje!=null)
	{
		zkje=zkje.trim();
		if (!(zkje.equals("")))	wheresql+=" and (crm_khxx.zkje="+zkje+") ";
	}
	fzxm=request.getParameter("fzxm");
	if (fzxm!=null)
	{
		fzxm=cf.GB2Uni(fzxm);
		if (!(fzxm.equals("")))	wheresql+=" and  (crm_khxx.fzxm='"+fzxm+"')";
	}


	zpsgd=request.getParameter("zpsgd");
	if (zpsgd!=null)
	{
		zpsgd=cf.GB2Uni(zpsgd);
		if (!(zpsgd.equals("")))	wheresql+=" and  (crm_khxx.zpsgd='"+zpsgd+"')";
	}
	zpyy=request.getParameter("zpyy");
	if (zpyy!=null)
	{
		zpyy=cf.GB2Uni(zpyy);
		if (!(zpyy.equals("")))	wheresql+=" and  (crm_khxx.zpyy='"+zpyy+"')";
	}
	pdclzt=request.getParameter("pdclzt");
	if (pdclzt!=null)
	{
		pdclzt=cf.GB2Uni(pdclzt);
		if (!(pdclzt.equals("")))	wheresql+=" and  (crm_khxx.pdclzt='"+pdclzt+"')";
	}
	hdbz=request.getParameter("hdbz");
	if (hdbz!=null)
	{
		hdbz=cf.GB2Uni(hdbz);
		if (!(hdbz.equals("")))	wheresql+=" and  (crm_khxx.hdbz='"+hdbz+"')";
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
		if (!(lrr.equals("")))	wheresql+=" and  (crm_khxx.lrr='"+lrr+"')";
	}
	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String ordersql=" order by "+jgpx1;
	if (!jgpx2.equals(""))
	{
		ordersql+=","+jgpx2;
	}
	if (!jgpx3.equals(""))
	{
		ordersql+=","+jgpx3;
	}


	ls_sql="SELECT crm_khxx.khbh,crm_khxx.hth,crm_khxx.qye,DECODE(crm_khxx.pdclzt,'1','�����ɵ�','2','�˹��ɵ�','5','�����ɵ�','6','��Ȩ�ɵ�','7','�ܵ�','8','��ʩ����','4','�����޸��ɵ�') pdclzt";
	ls_sql+=" ,DECODE(crm_khxx.kgsjqd,'Y','��ȷ��','N','<font color=\"#FF00FF\">δȷ��</font>') kgsjqd,sgdmc,pd_pdjl.sgbz,pd_pdjl.zjxm";
	ls_sql+=" ,DECODE(pd_pdjl.jlbz,'0','�˹��ɵ�','1','�ص�����','2','��˾����','3','���ʦָ���ɵ�','4','�ͻ�ָ���ɵ�','5','�󵥵�С��','6','С���ִ�','7','�������','8','�����ɵ�','9','ͬС���ɵ�') jlbz";
	ls_sql+=" ,pd_pdjl.pdsm,pd_pdjl.pdsj,pd_pdjl.pdr,DECODE(pd_pdjl.shzzb,'Y','ռָ��','N','��ռ') shzzb,TO_CHAR(pd_pdjl.sgdyxj) sgdyxj,jyjdrq";
	ls_sql+=" ,DECODE(crm_khxx.hdbz,'1','�ǻص�','2','���ʦ�ص�','3','ʩ���ӻص�','4','�Ͽͻ��ص�','5','Ա���ص�','6','�೤�ص�','7','��¥��','8','������','9','����') hdbz";
	ls_sql+=" ,khxm,fwdz,sjs,sq_dwxx.dwmc,DECODE(pd_pdjl.hfjl,'0','����','3','�ܵ�','5','��ʩ����') hfjl,DECODE(pd_pdjl.kppdbz,'1','�ǿ����ɵ�','2','�����ɵ�') kppdbz,TO_CHAR(pd_pdjl.xuhao) xuhao";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd,pd_pdjl ";
    ls_sql+=" where pd_pdjl.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) and pd_pdjl.sgd=sq_sgd.sgd(+)  ";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
	ls_sql+=ordersql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_khxxCxList.jsp","SelectCxCrm_khxx.jsp","","");
	pageObj.setPageRow(50);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"khbh","hth","khxm","qye","pdclzt","kgsjqd","sgdmc","sgbz","zjxm","jlbz","pdsj","pdr","shzzb","sgdyxj","hfjl","pdsm","kppdbz","xuhao","jyjdrq","hdbz","fwdz","sjs","dwmc"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/pdgl/psgd/DyPdCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(240);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">�ɹ���;</td>
	<td  width="4%">��ͬ��</td>
	<td  width="4%">����</td>
	<td  width="5%">ǩԼ��</td>
	<td  width="3%">�ɵ�״̬</td>
	<td  width="3%">����ʱ��</td>
	<td  width="3%">ʩ����</td>
	<td  width="3%">����</td>
	<td  width="3%">�ʼ�</td>
	<td  width="4%">�ɵ�����</td>
	<td  width="4%">�ɵ�ʱ��</td>
	<td  width="3%">�ɵ���</td>
	<td  width="3%">�Ƿ�ռָ��</td>
	<td  width="3%">�ɵ����ȼ�</td>
	<td  width="3%">�Ƿ�ܵ�</td>
	<td  width="12%">�ɵ�˵��</td>
	<td  width="4%">�����ɵ���־</td>
	<td  width="3%">���</td>
	<td  width="4%">��������</td>
	<td  width="4%">�ص���־</td>
	<td  width="11%">���ݵ�ַ</td>
	<td  width="4%">���ʦ</td>
	<td  width="7%">ǩԼ����</td>
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