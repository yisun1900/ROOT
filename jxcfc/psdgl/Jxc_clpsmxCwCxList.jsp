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

	String zzsgd=null;
	String crm_khxx_sgd=null;
	zzsgd=request.getParameter("zzsgd");
	if (zzsgd!=null)
	{
		if (!(zzsgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+zzsgd+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}



	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
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
	String qyrq=null;
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}



	String yxcld=request.getParameter("yxcld");
	if (yxcld!=null)
	{
		if (yxcld.equals("1"))
		{
			wheresql+=" and  (jxc_clpsd.psdzt in('2','3','5'))";
		}
		else if (yxcld.equals("2"))
		{
			wheresql+=" and  (jxc_clpsd.psdzt in('0','1','6','7'))";
		}
		else if (yxcld.equals("3"))
		{
			wheresql+=" and  (jxc_clpsd.psdzt in('2','5'))";
		}
		else if (yxcld.equals("4"))
		{
			wheresql+=" and  (jxc_clpsd.psdzt in('3','5'))";
		}
	}

	String jxc_clpsd_psph=null;
	String jxc_clpsd_lrrq=null;
	String jxc_clpsd_psdzt=null;
	String jxc_clpsd_dysj=null;
	String shsj=null;
	String jxc_clpsd_lrr=null;
	String jxc_clpsd_shjl=null;
	String jxc_clpsd_jhshsj=null;
	String jxc_clpsd_dybz=null;

	jxc_clpsd_psph=request.getParameter("jxc_clpsd_psph");
	if (jxc_clpsd_psph!=null)
	{
		jxc_clpsd_psph=cf.GB2Uni(jxc_clpsd_psph);
		if (!(jxc_clpsd_psph.equals("")))	wheresql+=" and  (jxc_clpsmx.psph='"+jxc_clpsd_psph+"')";
	}

	jxc_clpsd_lrrq=request.getParameter("jxc_clpsd_lrrq");
	if (jxc_clpsd_lrrq!=null)
	{
		jxc_clpsd_lrrq=jxc_clpsd_lrrq.trim();
		if (!(jxc_clpsd_lrrq.equals("")))	wheresql+="  and (jxc_clpsd.lrrq>=TO_DATE('"+jxc_clpsd_lrrq+"','YYYY/MM/DD'))";
	}
	jxc_clpsd_lrrq=request.getParameter("jxc_clpsd_lrrq2");
	if (jxc_clpsd_lrrq!=null)
	{
		jxc_clpsd_lrrq=jxc_clpsd_lrrq.trim();
		if (!(jxc_clpsd_lrrq.equals("")))	wheresql+="  and (jxc_clpsd.lrrq<=TO_DATE('"+jxc_clpsd_lrrq+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	jxc_clpsd_psdzt=request.getParameter("jxc_clpsd_psdzt");
	if (jxc_clpsd_psdzt!=null)
	{
		jxc_clpsd_psdzt=cf.GB2Uni(jxc_clpsd_psdzt);
		if (!(jxc_clpsd_psdzt.equals("")))	wheresql+=" and  (jxc_clpsd.psdzt='"+jxc_clpsd_psdzt+"')";
	}
	jxc_clpsd_dysj=request.getParameter("jxc_clpsd_dysj");
	if (jxc_clpsd_dysj!=null)
	{
		jxc_clpsd_dysj=jxc_clpsd_dysj.trim();
		if (!(jxc_clpsd_dysj.equals("")))	wheresql+="  and (jxc_clpsd.dysj>=TO_DATE('"+jxc_clpsd_dysj+"','YYYY/MM/DD'))";
	}
	jxc_clpsd_dysj=request.getParameter("jxc_clpsd_dysj2");
	if (jxc_clpsd_dysj!=null)
	{
		jxc_clpsd_dysj=jxc_clpsd_dysj.trim();
		if (!(jxc_clpsd_dysj.equals("")))	wheresql+="  and (jxc_clpsd.dysj<=TO_DATE('"+jxc_clpsd_dysj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	shsj=request.getParameter("shsj");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (jxc_clpsd.shsj>=TO_DATE('"+shsj+"','YYYY/MM/DD'))";
	}
	shsj=request.getParameter("shsj2");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (jxc_clpsd.shsj<=TO_DATE('"+shsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	jxc_clpsd_lrr=request.getParameter("jxc_clpsd_lrr");
	if (jxc_clpsd_lrr!=null)
	{
		jxc_clpsd_lrr=cf.GB2Uni(jxc_clpsd_lrr);
		if (!(jxc_clpsd_lrr.equals("")))	wheresql+=" and  (jxc_clpsd.lrr='"+jxc_clpsd_lrr+"')";
	}
	jxc_clpsd_shjl=request.getParameter("jxc_clpsd_shjl");
	if (jxc_clpsd_shjl!=null)
	{
		jxc_clpsd_shjl=cf.GB2Uni(jxc_clpsd_shjl);
		if (!(jxc_clpsd_shjl.equals("")))	wheresql+=" and  (jxc_clpsd.shjl='"+jxc_clpsd_shjl+"')";
	}
	jxc_clpsd_jhshsj=request.getParameter("jxc_clpsd_jhshsj");
	if (jxc_clpsd_jhshsj!=null)
	{
		jxc_clpsd_jhshsj=jxc_clpsd_jhshsj.trim();
		if (!(jxc_clpsd_jhshsj.equals("")))	wheresql+="  and (jxc_clpsd.jhshsj>=TO_DATE('"+jxc_clpsd_jhshsj+"','YYYY/MM/DD'))";
	}
	jxc_clpsd_jhshsj=request.getParameter("jxc_clpsd_jhshsj2");
	if (jxc_clpsd_jhshsj!=null)
	{
		jxc_clpsd_jhshsj=jxc_clpsd_jhshsj.trim();
		if (!(jxc_clpsd_jhshsj.equals("")))	wheresql+="  and (jxc_clpsd.jhshsj<=TO_DATE('"+jxc_clpsd_jhshsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	jxc_clpsd_dybz=request.getParameter("jxc_clpsd_dybz");
	if (jxc_clpsd_dybz!=null)
	{
		jxc_clpsd_dybz=cf.GB2Uni(jxc_clpsd_dybz);
		if (!(jxc_clpsd_dybz.equals("")))	wheresql+=" and  (jxc_clpsd.dybz='"+jxc_clpsd_dybz+"')";
	}


	String cldlbm=null;
	String clxlbm=null;
	String jxc_clpsmx_clbm=null;
	String jxc_clpsmx_clmc=null;
	String jxc_clpsmx_clmc2=null;
	String jxc_clpsmx_xh=null;
	String jxc_clpsmx_gg=null;
	String jxc_clpsmx_nbbm=null;
	String jxc_clpsmx_ppmc=null;
	String jxc_clpsmx_gysmc=null;
	cldlbm=request.getParameter("cldlbm");
	if (cldlbm!=null)
	{
		cldlbm=cf.GB2Uni(cldlbm);
		if (!(cldlbm.equals("")))	wheresql+=" and  (jxc_clpsmx.cldlbm='"+cldlbm+"')";
	}
	clxlbm=request.getParameter("clxlbm");
	if (clxlbm!=null)
	{
		clxlbm=cf.GB2Uni(clxlbm);
		if (!(clxlbm.equals("")))	wheresql+=" and  (jxc_clpsmx.clxlbm='"+clxlbm+"')";
	}
	jxc_clpsmx_clbm=request.getParameter("jxc_clpsmx_clbm");
	if (jxc_clpsmx_clbm!=null)
	{
		jxc_clpsmx_clbm=cf.GB2Uni(jxc_clpsmx_clbm);
		if (!(jxc_clpsmx_clbm.equals("")))	wheresql+=" and  (jxc_clpsmx.clbm='"+jxc_clpsmx_clbm+"')";
	}
	jxc_clpsmx_clmc=request.getParameter("jxc_clpsmx_clmc");
	if (jxc_clpsmx_clmc!=null)
	{
		jxc_clpsmx_clmc=cf.GB2Uni(jxc_clpsmx_clmc);
		if (!(jxc_clpsmx_clmc.equals("")))	wheresql+=" and  (jxc_clpsmx.clmc='"+jxc_clpsmx_clmc+"')";
	}
	jxc_clpsmx_clmc2=request.getParameter("jxc_clpsmx_clmc2");
	if (jxc_clpsmx_clmc2!=null)
	{
		jxc_clpsmx_clmc2=cf.GB2Uni(jxc_clpsmx_clmc2);
		if (!(jxc_clpsmx_clmc2.equals("")))	wheresql+=" and  (jxc_clpsmx.clmc like '%"+jxc_clpsmx_clmc2+"%')";
	}
	jxc_clpsmx_xh=request.getParameter("jxc_clpsmx_xh");
	if (jxc_clpsmx_xh!=null)
	{
		jxc_clpsmx_xh=cf.GB2Uni(jxc_clpsmx_xh);
		if (!(jxc_clpsmx_xh.equals("")))	wheresql+=" and  (jxc_clpsmx.xh like '%"+jxc_clpsmx_xh+"%')";
	}
	jxc_clpsmx_gg=request.getParameter("jxc_clpsmx_gg");
	if (jxc_clpsmx_gg!=null)
	{
		jxc_clpsmx_gg=cf.GB2Uni(jxc_clpsmx_gg);
		if (!(jxc_clpsmx_gg.equals("")))	wheresql+=" and  (jxc_clpsmx.gg like '%"+jxc_clpsmx_gg+"%')";
	}
	jxc_clpsmx_nbbm=request.getParameter("jxc_clpsmx_nbbm");
	if (jxc_clpsmx_nbbm!=null)
	{
		jxc_clpsmx_nbbm=cf.GB2Uni(jxc_clpsmx_nbbm);
		if (!(jxc_clpsmx_nbbm.equals("")))	wheresql+=" and  (jxc_clpsmx.nbbm='"+jxc_clpsmx_nbbm+"')";
	}
	jxc_clpsmx_ppmc=request.getParameter("jxc_clpsmx_ppmc");
	if (jxc_clpsmx_ppmc!=null)
	{
		jxc_clpsmx_ppmc=cf.GB2Uni(jxc_clpsmx_ppmc);
		if (!(jxc_clpsmx_ppmc.equals("")))	wheresql+=" and  (jxc_clpsmx.ppmc='"+jxc_clpsmx_ppmc+"')";
	}
	jxc_clpsmx_gysmc=request.getParameter("jxc_clpsmx_gysmc");
	if (jxc_clpsmx_gysmc!=null)
	{
		jxc_clpsmx_gysmc=cf.GB2Uni(jxc_clpsmx_gysmc);
		if (!(jxc_clpsmx_gysmc.equals("")))	wheresql+=" and  (jxc_clpsmx.gysmc='"+jxc_clpsmx_gysmc+"')";
	}

	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String jgpx4=cf.GB2Uni(request.getParameter("jgpx4"));
	String jgpx5=cf.GB2Uni(request.getParameter("jgpx5"));
	String jgpx6=cf.GB2Uni(request.getParameter("jgpx6"));
	String ordersql=" order by "+jgpx1;
	if (!jgpx2.equals(""))
	{
		ordersql+=","+jgpx2;
	}
	if (!jgpx3.equals(""))
	{
		ordersql+=","+jgpx3;
	}
	if (!jgpx4.equals(""))
	{
		ordersql+=","+jgpx4;
	}
	if (!jgpx5.equals(""))
	{
		ordersql+=","+jgpx5;
	}
	if (!jgpx6.equals(""))
	{
		ordersql+=","+jgpx6;
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=request.getParameter("myxssl");

	ls_sql="SELECT jxc_clpsd.khbh,crm_khxx.hth,crm_khxx.khxm,sq_sgd.sgdmc,crm_khxx.fwdz,jxc_clpsmx.psph,TO_CHAR(jxc_clpsmx.psxh),jxc_clpsmx.nbbm,jxc_clpsmx.clmc,jxc_clpsmx.jldwbm,jxc_clpsmx.sqpssl,jxc_clpsmx.pssl,TO_CHAR(jxc_clpsmx.cbj),TO_CHAR(jxc_clpsmx.dj),ROUND(jxc_clpsmx.cbj*jxc_clpsmx.pssl,2),jxc_clpsmx.psje,jxc_clpsmx.cksl,jxc_clpsmx.xh,jxc_clpsmx.gg,jxc_clpsmx.clbm,jxc_clpsmx.cldlbm,jxc_clpsmx.clxlbm,jxc_clpsmx.ppmc,jxc_clpsmx.gysmc, DECODE(jxc_clpsd.psdzt,'0','�ȴ��ύ','1','�ȴ����','6','�����','2','�ȴ�����','3','�ѳ���','5','���ֳ���'),jxc_clpsd.lrrq,jxc_clpsd.jhshsj,jxc_clpsd.shsj, DECODE(jxc_clpsd.shjl,'Y','ͬ��','N','����','M','���������޸�'),jxc_clpsd.dysj,dwmc ";
	ls_sql+=" FROM jxc_clpsd,jxc_clpsmx,crm_khxx,sq_sgd,sq_dwxx  ";
    ls_sql+=" where jxc_clpsmx.psph=jxc_clpsd.psph(+) and jxc_clpsd.khbh=crm_khxx.khbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=ordersql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_clpsmxCwCxList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"psph"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCwJxc_clpsd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("psph",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp?";//Ϊ�в�����coluParm.link���ó�������
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
  <B><font size="3">���ϵ���ϸ�������ѯ </font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(360);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">�ͻ����</td>
	<td  width="2%">��ͬ��</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="2%">ʩ����</td>
	<td  width="7%">���ݵ�ַ</td>
	<td  width="3%">���ϵ���</td>
	<td  width="2%">���</td>
	<td  width="3%">�ڲ�����</td>
	<td  width="5%">��������</td>
	<td  width="2%">������λ</td>
	<td  width="2%">��������</td>
	<td  width="2%">��˺�����</td>
	<td  width="3%">�ɱ�����</td>
	<td  width="3%">��������</td>
	<td  width="4%">�ɱ����</td>
	<td  width="4%">�������</td>
	<td  width="2%">��������</td>
	<td  width="3%">�ͺ�</td>
	<td  width="4%">���</td>
	<td  width="3%">���ϱ���</td>
	<td  width="4%">���ϴ���</td>
	<td  width="4%">����С��</td>
	<td  width="4%">Ʒ��</td>
	<td  width="7%">��Ӧ��</td>
	<td  width="3%">���ϵ�״̬</td>
	<td  width="3%">¼������</td>
	<td  width="3%">�ƻ��ͻ�ʱ��</td>
	<td  width="3%">���ʱ��</td>
	<td  width="2%">��˽���</td>
	<td  width="3%">��ӡʱ��</td>
	<td  width="5%">ǩ������</td>
</tr>
<%
	pageObj.printDateSum();
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