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

	
	
	String crm_khxx_gcjdbm=null;
	String crm_khxx_wgbz=null;
	crm_khxx_gcjdbm=request.getParameter("crm_khxx_gcjdbm");
	if (crm_khxx_gcjdbm!=null)
	{
		crm_khxx_gcjdbm=cf.GB2Uni(crm_khxx_gcjdbm);
		if (!(crm_khxx_gcjdbm.equals("")))	wheresql+=" and  (crm_khxx.gcjdbm='"+crm_khxx_gcjdbm+"')";
	}
	crm_khxx_wgbz=request.getParameter("crm_khxx_wgbz");
	if (crm_khxx_wgbz!=null)
	{
		if (crm_khxx_wgbz.equals("1"))//1+δ�깤&2+�ѿ���&3+���깤
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('1'))";
		}
		else if (crm_khxx_wgbz.equals("2"))
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('2','3','6'))";
		}
		else if (crm_khxx_wgbz.equals("3"))
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('4','5'))";
		}
	}

	String ycksl=null;
	ycksl=request.getParameter("ycksl");
	if (ycksl!=null)
	{
		ycksl=cf.GB2Uni(ycksl);
		if (!(ycksl.equals("")))	wheresql+=" and  (jxc_clpsd.ycksl>='"+ycksl+"')";
	}
	ycksl=request.getParameter("ycksl2");
	if (ycksl!=null)
	{
		ycksl=cf.GB2Uni(ycksl);
		if (!(ycksl.equals("")))	wheresql+=" and  (jxc_clpsd.ycksl<='"+ycksl+"')";
	}
	String yckje=null;
	yckje=request.getParameter("yckje");
	if (yckje!=null)
	{
		yckje=cf.GB2Uni(yckje);
		if (!(yckje.equals("")))	wheresql+=" and  (jxc_clpsd.yckje>='"+yckje+"')";
	}
	yckje=request.getParameter("yckje2");
	if (yckje!=null)
	{
		yckje=cf.GB2Uni(yckje);
		if (!(yckje.equals("")))	wheresql+=" and  (jxc_clpsd.yckje<='"+yckje+"')";
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

	
	
	
	String psph=null;
	String psdzt=null;
	String psfs=null;
	String lrr=null;
	String lrrq=null;
	String jhshsj=null;
	psph=request.getParameter("psph");
	if (psph!=null)
	{
		psph=cf.GB2Uni(psph);
		if (!(psph.equals("")))	wheresql+=" and  (jxc_clpsd.psph='"+psph+"')";
	}
	psdzt=request.getParameter("psdzt");
	if (psdzt!=null)
	{
		psdzt=cf.GB2Uni(psdzt);
		if (!(psdzt.equals("")))	wheresql+=" and  (jxc_clpsd.psdzt='"+psdzt+"')";
	}
	psfs=request.getParameter("psfs");
	if (psfs!=null)
	{
		psfs=cf.GB2Uni(psfs);
		if (!(psfs.equals("")))	wheresql+=" and  (jxc_clpsd.psfs='"+psfs+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (jxc_clpsd.lrr='"+lrr+"')";
	}
	lrrq=request.getParameter("lrrq");
	if (lrrq!=null)
	{
		lrrq=lrrq.trim();
		if (!(lrrq.equals("")))	wheresql+="  and (jxc_clpsd.lrrq>=TO_DATE('"+lrrq+"','YYYY/MM/DD'))";
	}
	lrrq=request.getParameter("lrrq2");
	if (lrrq!=null)
	{
		lrrq=lrrq.trim();
		if (!(lrrq.equals("")))	wheresql+="  and (jxc_clpsd.lrrq<=TO_DATE('"+lrrq+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	jhshsj=request.getParameter("jhshsj");
	if (jhshsj!=null)
	{
		jhshsj=jhshsj.trim();
		if (!(jhshsj.equals("")))	wheresql+="  and (jxc_clpsd.jhshsj>=TO_DATE('"+jhshsj+"','YYYY/MM/DD'))";
	}
	jhshsj=request.getParameter("jhshsj2");
	if (jhshsj!=null)
	{
		jhshsj=jhshsj.trim();
		if (!(jhshsj.equals("")))	wheresql+="  and (jxc_clpsd.jhshsj<=TO_DATE('"+jhshsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}


	String dybz=null;
	dybz=request.getParameter("dybz");
	if (dybz!=null)
	{
		dybz=cf.GB2Uni(dybz);
		if (!(dybz.equals("")))	wheresql+=" and  (jxc_clpsd.dybz='"+dybz+"')";
	}
	String dyr=null;
	dyr=request.getParameter("dyr");
	if (dyr!=null)
	{
		dyr=cf.GB2Uni(dyr);
		if (!(dyr.equals("")))	wheresql+=" and  (jxc_clpsd.dyr='"+dyr+"')";
	}
	String dysj=null;
	dysj=request.getParameter("dysj");
	if (dysj!=null)
	{
		dysj=dysj.trim();
		if (!(dysj.equals("")))	wheresql+="  and (jxc_clpsd.dysj>=TO_DATE('"+dysj+"','YYYY/MM/DD'))";
	}
	dysj=request.getParameter("dysj2");
	if (dysj!=null)
	{
		dysj=dysj.trim();
		if (!(dysj.equals("")))	wheresql+="  and (jxc_clpsd.dysj<=TO_DATE('"+dysj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	String myxssl=null;
	myxssl=request.getParameter("myxssl");

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}



	ls_sql="SELECT jxc_clpsd.psph,DECODE(jxc_clpsd.psdzt,'0','�ȴ��ύ','1','�ȴ����','2','�ȴ�����','3','�ѳ���','5','���ֳ���','6','���������޸�','7','����') psdzt,DECODE(jxc_clpsd.shjl,'Y','ͬ��','N','����','M','���������޸�'),jxc_clpsd.shr,jxc_clpsd.shsj,DECODE(jxc_clpsd.dybz,'Y','��ӡ','N','δ��ӡ'),jxc_clpsd.dysj,jxc_clpsd.khbh,crm_khxx.hth,crm_khxx.khxm,sq_sgd.sgdmc,crm_khxx.fwdz,ysgcjdmc,jxc_clpsd.ycksl,jxc_clpsd.yckje,jxc_clpsd.pszsl,jxc_clpsd.pszje,jxc_clpsd.yf,jxc_clpsd.qtsf,jxc_clpsd.fkje,DECODE(jxc_clpsd.psfs,'1','����','2','����','9','����') psfs,jxc_clpsd.jhshsj,jxc_clpsd.lrr,jxc_clpsd.lrrq,a.dwmc ssfgs,b.dwmc ssbm,jxc_clpsd.shsm,jxc_clpsd.bz  ";
	ls_sql+=" FROM jxc_clpsd,crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd,dm_gcjdbm  ";
    ls_sql+=" where jxc_clpsd.khbh=crm_khxx.khbh(+) ";
    ls_sql+=" and crm_khxx.fgsbh=a.dwbh and crm_khxx.dwbh=b.dwbh   ";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)  and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
	ls_sql+=" and jxc_clpsd.fclb!='4'";//1��������2�����ϣ�3�����ڣ�4���˵�

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_clpsd.lrrq desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_clpsdCxList.jsp","","","/jxcdy/chooseDypsd.jsp");
	pageObj.setPageRow(Integer.parseInt(myxssl));


//��������
	String[] keyName={"psph"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("��ӡ");

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"psph"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewJxc_clpsd.jsp";//Ϊ�в�����coluParm.link���ó�������
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
  <B><font size="3">���ϵ���ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(320);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">���ϵ���</td>
	<td  width="3%">���ϵ�״̬</td>
	<td  width="3%">��˽���</td>
	<td  width="2%">�����</td>
	<td  width="3%">���ʱ��</td>
	<td  width="2%">��ӡ��־</td>
	<td  width="3%">��ӡʱ��</td>
	<td  width="2%">�ͻ����</td>
	<td  width="3%">��ͬ��</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="2%">ʩ����</td>
	<td  width="8%">���ݵ�ַ</td>
	<td  width="3%">���̽���</td>
	<td  width="3%">�ѳ�������</td>
	<td  width="3%">�ѳ�����</td>
	<td  width="3%">���ϵ�����</td>
	<td  width="4%">���ϵ����</td>
	<td  width="3%">�˷�</td>
	<td  width="3%">�����շ�</td>
	<td  width="3%">������</td>
	<td  width="2%">���ͷ�ʽ</td>
	<td  width="3%">�ƻ��ͻ�ʱ��</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼������</td>
	<td  width="4%">�����ֹ�˾</td>
	<td  width="5%">����</td>
	<td  width="9%">���˵��</td>
	<td  width="11%">��ע</td>
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