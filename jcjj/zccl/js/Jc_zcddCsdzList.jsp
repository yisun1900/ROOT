<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������

String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");//08:�Ҿӹ���;10:��ĿרԱ;12:�Ҿ����ʦ;18:ľ�Ų���ʦ
String ssfgs=(String)session.getAttribute("ssfgs");
String xmzyglbz=cf.fillNull(cf.executeQuery("select xmzyglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//��ĿרԱ����
String jjgwglbz=cf.fillNull(cf.executeQuery("select jjgwglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//�Ҿӹ��ʹ���
String jjsjsglbz=cf.fillNull(cf.executeQuery("select jjsjsglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//�Ҿ����ʦ����

if (zwbm.equals("10"))//10:��ĿרԱ
{
	if (xmzyglbz.equals("N"))//���˱�־
	{
		zwbm="";
	}
}
else if (zwbm.equals("08"))//08:�Ҿӹ���
{
	if (jjgwglbz.equals("N"))//���˱�־
	{
		zwbm="";
	}
}
else if (zwbm.equals("12"))//12:�Ҿ����ʦ
{
	if (jjsjsglbz.equals("N"))//���˱�־
	{
		zwbm="";
	}
}

	
	
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String wheresql2="";
	String wheresql3="";


	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String crm_khxx_dwbh=null;
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}



	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}


	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}


	String ddbh=null;
	ddbh=request.getParameter("ddbh");
	if (ddbh!=null)
	{
		ddbh=cf.GB2Uni(ddbh);
		if (!(ddbh.equals("")))	wheresql2+=" and  (jc_zcdd.ddbh='"+ddbh+"')";
		if (!(ddbh.equals("")))	wheresql3+=" and  (jc_zczjx.ddbh='"+ddbh+"')";
	}


	String zcdlbm=null;
	zcdlbm=request.getParameter("zcdlbm");
	if (zcdlbm!=null)
	{
		zcdlbm=cf.GB2Uni(zcdlbm);
		if (!(zcdlbm.equals("")))	wheresql2+=" and  (jc_zcdd.zcdlbm='"+zcdlbm+"')";
		if (!(zcdlbm.equals("")))	wheresql3+=" and  (jc_zczjx.zcdlbm='"+zcdlbm+"')";
	}
	String zcxlbm=null;
	zcxlbm=request.getParameter("zcxlbm");
	if (zcxlbm!=null)
	{
		zcxlbm=cf.GB2Uni(zcxlbm);
		if (!(zcxlbm.equals("")))	wheresql2+=" and  (jc_zcdd.zcxlbm='"+zcxlbm+"')";
		if (!(zcxlbm.equals("")))	wheresql3+=" and  (jc_zczjx.zcxlbm='"+zcxlbm+"')";
	}
	String ppbm=null;
	ppbm=request.getParameter("ppbm");
	if (ppbm!=null)
	{
		ppbm=cf.GB2Uni(ppbm);
		if (!(ppbm.equals("")))	wheresql2+=" and  (jc_zcdd.ppbm='"+ppbm+"')";
		if (!(ppbm.equals("")))	wheresql3+=" and  (jc_zczjx.ppbm='"+ppbm+"')";
	}
	String ppbm2=null;
	ppbm2=request.getParameter("ppbm2");
	if (ppbm2!=null)
	{
		ppbm2=cf.GB2Uni(ppbm2);
		if (!(ppbm2.equals("")))	wheresql2+=" and  (jc_zcdd.ppbm like '%"+ppbm2+"%')";
		if (!(ppbm2.equals("")))	wheresql3+=" and  (jc_zczjx.ppbm like '%"+ppbm2+"%')";
	}
	String ppmc=null;
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql2+=" and  (jc_zcdd.ppmc='"+ppmc+"')";
		if (!(ppmc.equals("")))	wheresql3+=" and  (jc_zczjx.ppmc='"+ppmc+"')";
	}
	String ppmc2=null;
	ppmc2=request.getParameter("ppmc2");
	if (ppmc2!=null)
	{
		ppmc2=cf.GB2Uni(ppmc2);
		if (!(ppmc2.equals("")))	wheresql2+=" and  (jc_zcdd.ppmc like '%"+ppmc2+"%')";
		if (!(ppmc2.equals("")))	wheresql3+=" and  (jc_zczjx.ppmc like '%"+ppmc2+"%')";
	}
	String gys=null;
	gys=request.getParameter("gys");
	if (gys!=null)
	{
		gys=cf.GB2Uni(gys);
		if (!(gys.equals("")))	wheresql2+=" and  (jc_zcdd.gys='"+gys+"')";
		if (!(gys.equals("")))	wheresql3+=" and  (jc_zczjx.gys='"+gys+"')";
	}
	String gys2=null;
	gys2=request.getParameter("gys2");
	if (gys2!=null)
	{
		gys2=cf.GB2Uni(gys2);
		if (!(gys2.equals("")))	wheresql2+=" and  (jc_zcdd.gys like '%"+gys2+"%')";
		if (!(gys2.equals("")))	wheresql3+=" and  (jc_zczjx.gys like '%"+gys2+"%')";
	}

	String ztjjgw=null;
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql2+=" and  (jc_zcdd.ztjjgw='"+ztjjgw+"')";
		if (!(ztjjgw.equals("")))	wheresql3+=" and  (jc_zczjx.ztjjgw='"+ztjjgw+"')";
	}
	String clgw=null;
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql2+=" and  (jc_zcdd.clgw='"+clgw+"')";
		if (!(clgw.equals("")))	wheresql3+=" and  (jc_zczjx.clgw='"+clgw+"')";
	}
	String xmzy=null;
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql2+=" and  (jc_zcdd.xmzy='"+xmzy+"')";
		if (!(xmzy.equals("")))	wheresql3+=" and  (jc_zczjx.xmzy='"+xmzy+"')";
	}

	String wjsj=null;
	wjsj=request.getParameter("wjsj");
	if (wjsj!=null)
	{
		wjsj=wjsj.trim();
		if (!(wjsj.equals("")))	wheresql2+="  and (jc_zcdd.wjsj>=TO_DATE('"+wjsj+"','YYYY-MM-DD'))";
	}
	wjsj=request.getParameter("wjsj2");
	if (wjsj!=null)
	{
		wjsj=wjsj.trim();
		if (!(wjsj.equals("")))	wheresql2+="  and (jc_zcdd.wjsj<=TO_DATE('"+wjsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	String sshsj=null;
	sshsj=request.getParameter("sshsj");
	if (sshsj!=null)
	{
		sshsj=sshsj.trim();
		if (!(sshsj.equals("")))	wheresql2+="  and (jc_zcdd.sshsj>=TO_DATE('"+sshsj+"','YYYY/MM/DD'))";
		if (!(sshsj.equals("")))	wheresql3+="  and (jc_zczjx.sshsj>=TO_DATE('"+sshsj+"','YYYY/MM/DD'))";
	}
	sshsj=request.getParameter("sshsj2");
	if (sshsj!=null)
	{
		sshsj=sshsj.trim();
		if (!(sshsj.equals("")))	wheresql2+="  and (jc_zcdd.sshsj<=TO_DATE('"+sshsj+"','YYYY/MM/DD'))";
		if (!(sshsj.equals("")))	wheresql3+="  and (jc_zczjx.sshsj<=TO_DATE('"+sshsj+"','YYYY/MM/DD'))";
	}
	String sxhtsfysh=null;
	sxhtsfysh=request.getParameter("sxhtsfysh");
	if (sxhtsfysh!=null)
	{
		if (!(sxhtsfysh.equals("")))	wheresql2+=" and  (jc_zcdd.sxhtsfysh='"+sxhtsfysh+"')";
		if (!(sxhtsfysh.equals("")))	wheresql3+=" and  (jc_zczjx.sxhtsfysh='"+sxhtsfysh+"')";
	}

	String sfjs=null;
	sfjs=request.getParameter("sfjs");
	if (sfjs!=null)
	{
		sfjs=cf.GB2Uni(sfjs);
		if (!(sfjs.equals("")))	wheresql2+=" and  (jc_zcdd.sfjs='"+sfjs+"')";
		if (!(sfjs.equals("")))	wheresql3+=" and  (jc_zczjx.sfjs='"+sfjs+"')";
	}

    ls_sql=" select * ";
    ls_sql+=" FROM ( ";
	ls_sql+=" SELECT jc_zcdd.ddbh,DECODE(jc_zcdd.sfjs,'N','δ����','C','���ñ�־','Y','�ѽ���','M','���������') sfjs,DECODE(jc_zcdd.sxhtsfysh,'M','����д','Y','�����','N','δ��'),clztmc,jc_zcdd.sshsj,ppbm,jc_zcdd.gys,crm_khxx.khxm,crm_khxx.hth,crm_khxx.fwdz,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy";
	ls_sql+=" FROM crm_khxx,jc_zcdd,jdm_zcddzt ";
    ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh";
    ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
    ls_sql+=" and jc_zcdd.sfjs in('N','C')";//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M�����������
    ls_sql+=" and jc_zcdd.clzt in('30')";
    ls_sql+=" and jc_zcdd.ddlx not in('9','C','E')";
	if (yhjs.equals("G0"))
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from jxc_ppgysdzb where gysbm='"+ygbh+"' )";
	}
	else{
		if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}

		if (zwbm.equals("08"))//08:�Ҿӹ���
		{
			ls_sql+=" and (jc_zcdd.clgw='"+yhmc+"' OR jc_zcdd.ztjjgw='"+yhmc+"' OR jc_zcdd.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("12"))//12:�Ҿ����ʦ
		{
			ls_sql+=" and (jc_zcdd.jjsjs='"+yhmc+"' OR jc_zcdd.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("10"))//10:��ĿרԱ
		{
			ls_sql+=" and (jc_zcdd.xmzy='"+yhmc+"' OR jc_zcdd.lrr='"+yhmc+"')";
		}
	}
    ls_sql+=wheresql;
    ls_sql+=wheresql2;

    ls_sql+=" UNION ALL ";

	ls_sql+=" SELECT jc_zczjx.zjxbh ddbh,DECODE(jc_zczjx.sfjs,'N','δ����','C','���ñ�־','Y','�ѽ���','M','���������') sfjs,DECODE(jc_zczjx.sxhtsfysh,'M','����д','Y','�����','N','δ��'),DECODE(jc_zczjx.clzt,'00','¼��δ���','01','¼�������','02','��ȷ��','04','�����ѽ���','03','���ͻ�','05','�����ͻ�','30','�������','99','�˵�') clztmc,jc_zczjx.sshsj,ppbm,jc_zczjx.gys,crm_khxx.khxm,crm_khxx.hth,crm_khxx.fwdz,jc_zczjx.clgw,jc_zczjx.ztjjgw,jc_zczjx.xmzy";
	ls_sql+=" FROM crm_khxx,jc_zczjx ";
    ls_sql+=" where jc_zczjx.khbh=crm_khxx.khbh";
    ls_sql+=" and jc_zczjx.sfjs in('N','C')";//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M�����������
    ls_sql+=" and jc_zczjx.clzt='30'";
	if (yhjs.equals("G0"))
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from jxc_ppgysdzb where gysbm='"+ygbh+"' )";
	}
	else{
		if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}
		if (zwbm.equals("08"))//08:�Ҿӹ���
		{
			ls_sql+=" and (jc_zczjx.clgw='"+yhmc+"' OR jc_zczjx.ztjjgw='"+yhmc+"' OR jc_zczjx.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("12"))//12:�Ҿ����ʦ
		{
			ls_sql+=" and (jc_zczjx.jjsjs='"+yhmc+"' OR jc_zczjx.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("10"))//10:��ĿרԱ
		{
			ls_sql+=" and (jc_zczjx.xmzy='"+yhmc+"' OR jc_zczjx.lrr='"+yhmc+"')";
		}
	}


    ls_sql+=wheresql;
    ls_sql+=wheresql3;

    ls_sql+=" ) ";
	ls_sql+=" order by sfjs,khxm,ddbh ";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//���ж����ʼ��
	pageObj.initPage("Jc_zcddCsdzList.jsp","","","");
	pageObj.setEditStr("����");//����ÿҳ��ʾ��¼��
	pageObj.setPageRow(300);
/*
//������ʾ��
	String[] disColName={"ddbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","jc_zcdd_clgw","jc_zcdd_jkxz","jc_zcdd_jkdd","jc_zcdd_ddshbz","jc_zcdd_hkze","jc_zcdd_xclbz","jc_zcdd_clzt","jc_zcdd_lrsj","jc_zcdd_dwbh","jc_zcdd_bz","jc_zcdd_xmzy","crm_khxx_lxfs"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);

//���ð�ť����
	String[] buttonName={"��������"};//��ť����ʾ����
	String[] buttonLink={"InsertJc_gysjsCsdz.jsp?ssfgs="+fgs};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewDdmx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	if (!yhjs.equals("G0"))
	{
		coluParm=new ColuParm();//����һ���в�������
		String[] coluKey1={"hth"};//�����в�����coluParm.key������
		coluParm.key=coluKey1;//�����в�����coluParm.key������
		coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
		coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
		coluParmHash.put("khxm",coluParm);//�в����������Hash��
		pageObj.setColuLink(coluParmHash);//�в����������Hash��
	}
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
  <B><font size="3">���̽������</B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(160);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="6%">�������</td>
	<td  width="5%">����״̬</td>
	<td  width="5%">��д��ͬ�Ƿ����</td>
	<td  width="5%">����״̬</td>
	<td  width="6%">�ͻ�ʱ��</td>
	<td  width="8%">��Ʒ��</td>
	<td  width="15%">��Ӧ��</td>
	<td  width="7%">�ͻ�����</td>
	<td  width="6%">��ͬ��</td>
	<td  width="14%">���ݵ�ַ</td>
	<td  width="5%">פ��Ҿӹ���</td>
	<td  width="5%">չ���Ҿӹ���</td>
	<td  width="5%">��ĿרԱ</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 
</body>
</html>

<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>

